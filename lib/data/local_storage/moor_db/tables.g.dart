// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Team extends DataClass implements Insertable<Team> {
  final String teamName;
  final int id;
  final TeamPlayerModel players;
  Team({required this.teamName, required this.id, required this.players});
  factory Team.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Team(
      teamName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_name'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      players: $TeamsTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}players']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['team_name'] = Variable<String>(teamName);
    map['id'] = Variable<int>(id);
    {
      final converter = $TeamsTable.$converter0;
      map['players'] = Variable<String>(converter.mapToSql(players)!);
    }
    return map;
  }

  TeamsCompanion toCompanion(bool nullToAbsent) {
    return TeamsCompanion(
      teamName: Value(teamName),
      id: Value(id),
      players: Value(players),
    );
  }

  factory Team.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Team(
      teamName: serializer.fromJson<String>(json['teamName']),
      id: serializer.fromJson<int>(json['id']),
      players: serializer.fromJson<TeamPlayerModel>(json['players']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'teamName': serializer.toJson<String>(teamName),
      'id': serializer.toJson<int>(id),
      'players': serializer.toJson<TeamPlayerModel>(players),
    };
  }

  Team copyWith({String? teamName, int? id, TeamPlayerModel? players}) => Team(
        teamName: teamName ?? this.teamName,
        id: id ?? this.id,
        players: players ?? this.players,
      );
  @override
  String toString() {
    return (StringBuffer('Team(')
          ..write('teamName: $teamName, ')
          ..write('id: $id, ')
          ..write('players: $players')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(teamName, id, players);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Team &&
          other.teamName == this.teamName &&
          other.id == this.id &&
          other.players == this.players);
}

class TeamsCompanion extends UpdateCompanion<Team> {
  final Value<String> teamName;
  final Value<int> id;
  final Value<TeamPlayerModel> players;
  const TeamsCompanion({
    this.teamName = const Value.absent(),
    this.id = const Value.absent(),
    this.players = const Value.absent(),
  });
  TeamsCompanion.insert({
    required String teamName,
    this.id = const Value.absent(),
    required TeamPlayerModel players,
  })  : teamName = Value(teamName),
        players = Value(players);
  static Insertable<Team> custom({
    Expression<String>? teamName,
    Expression<int>? id,
    Expression<TeamPlayerModel>? players,
  }) {
    return RawValuesInsertable({
      if (teamName != null) 'team_name': teamName,
      if (id != null) 'id': id,
      if (players != null) 'players': players,
    });
  }

  TeamsCompanion copyWith(
      {Value<String>? teamName,
      Value<int>? id,
      Value<TeamPlayerModel>? players}) {
    return TeamsCompanion(
      teamName: teamName ?? this.teamName,
      id: id ?? this.id,
      players: players ?? this.players,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (teamName.present) {
      map['team_name'] = Variable<String>(teamName.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (players.present) {
      final converter = $TeamsTable.$converter0;
      map['players'] = Variable<String>(converter.mapToSql(players.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamsCompanion(')
          ..write('teamName: $teamName, ')
          ..write('id: $id, ')
          ..write('players: $players')
          ..write(')'))
        .toString();
  }
}

class $TeamsTable extends Teams with TableInfo<$TeamsTable, Team> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TeamsTable(this._db, [this._alias]);
  final VerificationMeta _teamNameMeta = const VerificationMeta('teamName');
  late final GeneratedColumn<String?> teamName = GeneratedColumn<String?>(
      'team_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _playersMeta = const VerificationMeta('players');
  late final GeneratedColumnWithTypeConverter<TeamPlayerModel, String?>
      players = GeneratedColumn<String?>('players', aliasedName, false,
              typeName: 'TEXT', requiredDuringInsert: true)
          .withConverter<TeamPlayerModel>($TeamsTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [teamName, id, players];
  @override
  String get aliasedName => _alias ?? 'teams';
  @override
  String get actualTableName => 'teams';
  @override
  VerificationContext validateIntegrity(Insertable<Team> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('team_name')) {
      context.handle(_teamNameMeta,
          teamName.isAcceptableOrUnknown(data['team_name']!, _teamNameMeta));
    } else if (isInserting) {
      context.missing(_teamNameMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_playersMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Team map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Team.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TeamsTable createAlias(String alias) {
    return $TeamsTable(_db, alias);
  }

  static TypeConverter<TeamPlayerModel, String> $converter0 =
      const MoorPlayerConvertor();
}

abstract class _$PlayerDatabase extends GeneratedDatabase {
  _$PlayerDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TeamsTable teams = $TeamsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [teams];
}
