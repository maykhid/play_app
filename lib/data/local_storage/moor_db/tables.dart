import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:play_app/data/model/db_model/team_player_model.dart';

export 'package:play_app/data/local_storage/database/shared.dart';
part 'tables.g.dart';

// @DataClassName("TeamPlayerTable")

// create team table
class Teams extends Table {
  TextColumn get teamName => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get players => text().map(const MoorPlayerConvertor())();
}

class MoorPlayerConvertor extends TypeConverter<TeamPlayerModel, String> {
  const MoorPlayerConvertor();

  @override
  TeamPlayerModel? mapToDart(String? fromDb) {
    if (fromDb == null) return null;
    return TeamPlayerModel.fromJson(json.decode(fromDb));
  }

  @override
  String? mapToSql(TeamPlayerModel? value) => json.encode(value!.toJson());
}

@DriftDatabase(tables: [Teams])
class PlayerDatabase extends _$PlayerDatabase {
  PlayerDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(onCreate: (Migrator m) {
  //     return m.createAll();
  //   }, beforeOpen: (team) async {
  //     if (team.wasCreated) {
  //       await into(teams).insert(Team(
  //           id: 1, teamName: 'test', players: TeamPlayerModel(players: [])));
  //       print('Saved!!!');
  //     }
  //   });
  // }

  Future insertTeam(TeamsCompanion entry) {
    try {
      print('Storing in db...');
      return into(teams).insert(entry);
    } catch (e, stackTrace) {
      throw Exception("Insert Exception: $e -- Stack Trace: $stackTrace");
    }
  }

  Future<List<Team>> extractTeam() async {
    try {
      print('Extracting from db...');
      print(await select(teams).get());
      return select(teams).get();
    } catch (e, stackTrace) {
      throw Exception("Extract Exception: $e -- Stack Trace: $stackTrace");
    }
  }
}
