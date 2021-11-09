import 'dart:async';

import 'package:play_app/constants/app_config.dart';
import 'package:play_app/data/model/response/players_response.dart';
import 'package:play_app/data/model/response/teams_response.dart';
import 'package:play_app/data/network_manager/network_manager.dart';

class ApiProvider {
  // get players
  Future<PlayersResponse> getPlayers() async {
    NetworkManager networkManager = NetworkManager();
    var completer = Completer<PlayersResponse>();
    try {
      final response = await networkManager.networkRequestManager(
        ApiConstants.playersPath,
        RequestType.GET,
      );
      final value = playersResponseFromJson(response);
      completer.complete(value);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  // get teams
  Future<TeamsResponse> getTeams() async {
    NetworkManager networkManager = NetworkManager();
    var completer = Completer<TeamsResponse>();
    try {
      final response = await networkManager.networkRequestManager(
        ApiConstants.teamsPath,
        RequestType.GET,
      );
      final value = teamsResponseFromJson(response);
      completer.complete(value);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}
