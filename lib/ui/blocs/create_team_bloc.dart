import 'package:drift/drift.dart';
import 'package:play_app/app/service_locator.dart';
import 'package:play_app/data/bloc_provider/bloc.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';
import 'package:play_app/data/model/db_model/team_player_model.dart';
import 'package:play_app/data/model/response/players_response.dart';
import 'package:play_app/data/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CreateTeamBloc extends Bloc {
  final _repo = Repository();

  final _showProgressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressStatusStream => _showProgressSubject.stream;
  Function(bool) get showProgressBar => _showProgressSubject.sink.add;

  final _createTeamSubject = PublishSubject<Team>();

  // create random team

  List<int> _generate30nums() {
    print('generating numbers...');
    List<int> nums = [];
    for (int i = 0; i < 30; i++) {
      nums.add(i);
    }
    return nums;
  }

  generateRandomTeam() async {
    print('generating team...');
    late List<Player>? players = [];
    int isDriverCount = 0;
    int isConstructorCount = 0;
    List<Player>? tempList = [];

   

    // get list of players from api
    await _repo.getPlayers().then((response) async {
      players = response.players;
      print("The players: $players");
    }, onError: (e, stackTrace) {
      throw ('Couldn\'t get players to generate random team, Error: $e, StackTrace: $stackTrace');
    });

    // generate 30 numbers representing each player
    // shuffle the numbers and use as index to create a shuffled list of players
    // of 5 DRs and 1 CR
    var random = _generate30nums();
    random.shuffle();
    for (int i = 0; i < players!.length; i++) {
      var player = players![random[i]];

      if (!player.isConstructor!) {
        if (isDriverCount <= 5 && (tempList.length < 6 && isDriverCount < 5)) {
          tempList.add(player);
        }
        isDriverCount++;
      } else if (player.isConstructor! &&
          (isConstructorCount < 1 && tempList.length < 6)) {
        tempList.add(player);
        isConstructorCount++;
      }
    }
    print(
        'List of players: ${tempList[0].isConstructor}, ${tempList[1].isConstructor}, ${tempList[2].isConstructor}, ${tempList[3].isConstructor}, ${tempList[4].isConstructor}, ${tempList[5].isConstructor}');

         final team = TeamsCompanion(teamName: const Value('test'), players: Value(TeamPlayerModel(players: tempList)));

    // PlayerDatabase? db;
    // db!.insertTeam(team);
    // print("Team: $team");
    await locator<PlayerDatabase>().insertTeam(team);
  }



  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}
