import 'package:flutter/material.dart';
import 'package:play_app/app/service_locator.dart';
import 'package:play_app/data/bloc_provider/bloc.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';
// import 'package:play_app/data/model/response/teams_response.dart';
import 'package:rxdart/rxdart.dart';

class GeneratedTeamBloc extends Bloc {
  final _showProgressSubject = BehaviorSubject<bool>();
  Stream<bool> get progressStatusStream => _showProgressSubject.stream;
  Function(bool) get showProgressBar => _showProgressSubject.sink.add;

  final _getStoredTeamSubject = PublishSubject<List<Team>>();
  Stream<List<Team>> get getStoredTeamStream => _getStoredTeamSubject.stream;

  final _constructListWidget = PublishSubject<List<Widget>>();
  Stream<List<Widget>> get constructedListStream => _constructListWidget.stream;

  getTeam() async {
    _showProgressSubject.sink.add(true);
    locator<PlayerDatabase>().extractTeam().then((response) async {
      _showProgressSubject.sink.add(false);
      _getStoredTeamSubject.sink.add(response);
    }, onError: (e) {
      _showProgressSubject.sink.add(false);
      _getStoredTeamSubject.sink.addError(e);
    });
  }

  // getConstructedList

  @override
  Future<void> dispose() async {
    _showProgressSubject.drain();
    await _showProgressSubject.close();

    _getStoredTeamSubject.drain();
    await _getStoredTeamSubject.close();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
