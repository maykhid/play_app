import 'package:play_app/data/bloc_provider/bloc.dart';
import 'package:play_app/data/model/response/players_response.dart';
import 'package:play_app/data/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PlayerScreenBloc extends Bloc {
  final _showProgressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressStatusStream => _showProgressSubject.stream;
  Function(bool) get showProgressBar => _showProgressSubject.sink.add;

  final _getPlayersSubject = PublishSubject<PlayersResponse>();
  Stream<PlayersResponse> get getPlayersStream => _getPlayersSubject.stream;

  final _repo = Repository();

  getPlayers() async {
    _showProgressSubject.sink.add(true);

    _repo.getPlayers().then((response) async {
      _showProgressSubject.sink.add(false);
      _getPlayersSubject.sink.add(response);
    }, onError: (e) {
      _showProgressSubject.sink.add(false);
      _getPlayersSubject.sink.addError(e);
    });
  }

  // dispose transactions
  @override
  void dispose() async {
   _getPlayersSubject.drain();
    await _getPlayersSubject.close();

    _showProgressSubject.drain();
    await _showProgressSubject.close();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
