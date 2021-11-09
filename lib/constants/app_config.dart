class AppConfig {
  static get baseURL {
    return _BaseUrlConfig.baseUrl;
  }
}

class _BaseUrlConfig {
  static const baseUrl  = "https://fantasy-stage-api.formula1.com/";
}

class ApiConstants {
  static const teamsPath = 'partner_games/f1/teams';
  static const playersPath = 'partner_games/f1/players';
}
