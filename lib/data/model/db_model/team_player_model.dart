import 'package:play_app/data/model/response/players_response.dart';

class TeamPlayerModel {
  List<Player>? players;

  TeamPlayerModel({this.players});

  factory TeamPlayerModel.fromJson(Map<String, dynamic> json) =>
      TeamPlayerModel(
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "players": List<dynamic>.from(players!.map((x) => x.toJson())),
      };
}
