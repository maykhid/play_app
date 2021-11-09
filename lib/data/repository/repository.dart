import 'package:play_app/data/model/response/players_response.dart';
import 'package:play_app/data/model/response/teams_response.dart';
import 'package:play_app/data/provider/api_providers.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<PlayersResponse> getPlayers() => apiProvider.getPlayers();
  Future<TeamsResponse> getTeams() => apiProvider.getTeams();
}
