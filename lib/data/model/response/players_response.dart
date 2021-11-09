// To parse this JSON data, do
//
//     final playersResponse = playersResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlayersResponse playersResponseFromJson(String str) =>
    PlayersResponse.fromJson(json.decode(str));

class PlayersResponse {
  PlayersResponse({
    required this.players,
    required this.meta,
  });

  List<Player> players;
  Meta meta;

  factory PlayersResponse.fromJson(Map<String, dynamic> json) =>
      PlayersResponse(
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );
}

class Meta {
  Meta({
    required this.total,
  });

  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
      );
}

class Player {
  Player({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.teamName,
    required this.position,
    required this.positionId,
    required this.positionAbbreviation,
    required this.price,
    required this.currentPriceChangeInfo,
    required this.status,
    required this.injured,
    required this.injuryType,
    required this.banned,
    required this.banType,
    required this.streakEventsProgress,
    required this.chanceOfPlaying,
    required this.teamAbbreviation,
    required this.weeklyPriceChange,
    required this.weeklyPriceChangePercentage,
    required this.teamId,
    required this.headshot,
    required this.knownName,
    required this.jerseyImage,
    required this.score,
    required this.humanizeStatus,
    required this.shirtNumber,
    required this.country,
    required this.isConstructor,
    required this.seasonScore,
    required this.driverData,
    required this.constructorData,
    required this.bornAt,
    required this.seasonPrices,
    required this.numFixturesInGameweek,
    required this.deletedInFeed,
    required this.hasFixture,
    required this.displayName,
    required this.externalId,
    required this.profileImage,
    required this.miscImage,
  });

  int id;
  String firstName;
  String lastName;
  String teamName;
  String position;
  int positionId;
  String positionAbbreviation;
  double price;
  CurrentPriceChangeInfo currentPriceChangeInfo;
  dynamic status;
  bool injured;
  dynamic injuryType;
  bool banned;
  dynamic banType;
  StreakEventsProgress streakEventsProgress;
  int chanceOfPlaying;
  String teamAbbreviation;
  double weeklyPriceChange;
  int weeklyPriceChangePercentage;
  int teamId;
  Headshot headshot;
  String? knownName;
  Image jerseyImage;
  int score;
  dynamic humanizeStatus;
  int shirtNumber;
  String? country;
  bool isConstructor;
  int seasonScore;
  DriverData? driverData;
  ConstructorData? constructorData;
  DateTime? bornAt;
  List<SeasonPrice> seasonPrices;
  int numFixturesInGameweek;
  bool deletedInFeed;
  bool hasFixture;
  String displayName;
  String externalId;
  Image profileImage;
  Image miscImage;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        teamName: json["team_name"],
        position: json["position"],
        positionId: json["position_id"],
        positionAbbreviation: json["position_abbreviation"],
        price: json["price"].toDouble(),
        currentPriceChangeInfo:
            CurrentPriceChangeInfo.fromJson(json["current_price_change_info"]),
        status: json["status"],
        injured: json["injured"],
        injuryType: json["injury_type"],
        banned: json["banned"],
        banType: json["ban_type"],
        streakEventsProgress:
            StreakEventsProgress.fromJson(json["streak_events_progress"]),
        chanceOfPlaying: json["chance_of_playing"],
        teamAbbreviation: json["team_abbreviation"],
        weeklyPriceChange: json["weekly_price_change"].toDouble(),
        weeklyPriceChangePercentage: json["weekly_price_change_percentage"],
        teamId: json["team_id"],
        headshot: Headshot.fromJson(json["headshot"]),
        knownName: json["known_name"] ?? null,
        jerseyImage: Image.fromJson(json["jersey_image"]),
        score: json["score"],
        humanizeStatus: json["humanize_status"],
        shirtNumber: json["shirt_number"] ?? null,
        country: json["country"] ?? null,
        isConstructor: json["is_constructor"],
        seasonScore: json["season_score"],
        driverData: json["driver_data"] == null
            ? null
            : DriverData.fromJson(json["driver_data"]),
        constructorData: json["constructor_data"] == null
            ? null
            : ConstructorData.fromJson(json["constructor_data"]),
        bornAt:
            json["born_at"] == null ? null : DateTime.parse(json["born_at"]),
        seasonPrices: List<SeasonPrice>.from(
            json["season_prices"].map((x) => SeasonPrice.fromJson(x))),
        numFixturesInGameweek: json["num_fixtures_in_gameweek"],
        deletedInFeed: json["deleted_in_feed"],
        hasFixture: json["has_fixture"],
        displayName: json["display_name"],
        externalId: json["external_id"],
        profileImage: Image.fromJson(json["profile_image"]),
        miscImage: Image.fromJson(json["misc_image"]),
      );
}

class ConstructorData {
  ConstructorData({
    required this.bestFinish,
    required this.bestFinishCount,
    required this.bestGrid,
    required this.bestGridCount,
    required this.titles,
    required this.championshipPoints,
    required this.firstSeason,
    required this.poles,
    required this.fastestLaps,
    required this.country,
    required this.highestRaceFinished,
  });

  int bestFinish;
  int bestFinishCount;
  int bestGrid;
  int bestGridCount;
  int titles;
  double championshipPoints;
  String firstSeason;
  int poles;
  int fastestLaps;
  String country;
  String highestRaceFinished;

  factory ConstructorData.fromJson(Map<String, dynamic> json) =>
      ConstructorData(
        bestFinish: json["best_finish"],
        bestFinishCount: json["best_finish_count"],
        bestGrid: json["best_grid"],
        bestGridCount: json["best_grid_count"],
        titles: json["titles"],
        championshipPoints: json["championship_points"].toDouble(),
        firstSeason: json["first_season"],
        poles: json["poles"],
        fastestLaps: json["fastest_laps"],
        country: json["country"],
        highestRaceFinished: json["highest_race_finished"],
      );
}

class CurrentPriceChangeInfo {
  CurrentPriceChangeInfo({
    required this.currentSelectionPercentage,
    required this.probabilityPriceUpPercentage,
    required this.probabilityPriceDownPercentage,
  });

  int currentSelectionPercentage;
  int probabilityPriceUpPercentage;
  int probabilityPriceDownPercentage;

  factory CurrentPriceChangeInfo.fromJson(Map<String, dynamic> json) =>
      CurrentPriceChangeInfo(
        currentSelectionPercentage: json["current_selection_percentage"],
        probabilityPriceUpPercentage: json["probability_price_up_percentage"],
        probabilityPriceDownPercentage:
            json["probability_price_down_percentage"],
      );
}

class DriverData {
  DriverData({
    required this.wins,
    required this.podiums,
    required this.poles,
    required this.fastestLaps,
    required this.grandsPrixEntered,
    required this.titles,
    required this.championshipPoints,
    required this.bestFinish,
    required this.bestFinishCount,
    required this.bestGrid,
    required this.bestGridCount,
    required this.highestRaceFinished,
    required this.placeOfBirth,
  });

  int wins;
  int podiums;
  int poles;
  int fastestLaps;
  int grandsPrixEntered;
  int titles;
  int championshipPoints;
  int bestFinish;
  int bestFinishCount;
  int bestGrid;
  int bestGridCount;
  String highestRaceFinished;
  String placeOfBirth;

  factory DriverData.fromJson(Map<String, dynamic> json) => DriverData(
        wins: json["wins"],
        podiums: json["podiums"],
        poles: json["poles"],
        fastestLaps: json["fastest_laps"],
        grandsPrixEntered: json["grands_prix_entered"],
        titles: json["titles"],
        championshipPoints: json["championship_points"],
        bestFinish: json["best_finish"],
        bestFinishCount: json["best_finish_count"],
        bestGrid: json["best_grid"],
        bestGridCount: json["best_grid_count"],
        highestRaceFinished: json["highest_race_finished"],
        placeOfBirth: json["place_of_birth"],
      );
}

class Headshot {
  Headshot({
    required this.profile,
    required this.pitchView,
    required this.playerList,
  });

  String profile;
  String pitchView;
  String playerList;

  factory Headshot.fromJson(Map<String, dynamic> json) => Headshot(
        profile: json["profile"],
        pitchView: json["pitch_view"],
        playerList: json["player_list"],
      );
}

class Image {
  Image({
    required this.url,
  });

  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"] ?? null,
      );

}

class SeasonPrice {
  SeasonPrice({
    required this.gamePeriodId,
    required this.price,
  });

  int gamePeriodId;
  double price;

  factory SeasonPrice.fromJson(Map<String, dynamic> json) => SeasonPrice(
        gamePeriodId: json["game_period_id"],
        price: json["price"].toDouble(),
      );
}

class StreakEventsProgress {
  StreakEventsProgress();

  factory StreakEventsProgress.fromJson(Map<String, dynamic> json) =>
      StreakEventsProgress();
}
