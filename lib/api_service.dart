import 'dart:convert';
import 'package:http/http.dart' as http;

class FootballApiService {
  static const String _baseUrl = "https://api.football-data.org/v4";
  static const String _apiKey = "05453e76f36b44189e5d92a6d85b8d90";

  static Future<Map<String, dynamic>> getTeamStats(
    int teamId,
    int season,
  ) async {
    final url = Uri.parse("$_baseUrl/teams/$teamId/matches?season=$season");

    final response = await http.get(url, headers: {"X-Auth-Token": _apiKey});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load stats: ${response.statusCode}");
    }
  }
}
