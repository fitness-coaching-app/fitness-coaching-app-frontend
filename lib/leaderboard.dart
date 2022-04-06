// To parse this JSON data, do
//
//     final leaderboard = leaderboardFromJson(jsonString);

import 'dart:convert';

Leaderboard leaderboardFromJson(String str) =>
    Leaderboard.fromJson(json.decode(str));

String leaderboardToJson(Leaderboard data) => json.encode(data.toJson());

class Leaderboard {
  Leaderboard({
    required this.results,
  });

  List<Result> results;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.rank,
    required this.username,
    required this.score,
    required this.url,
  });

  int rank;
  String username;
  int score;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        rank: json["rank"],
        username: json["username"],
        score: json["score"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "username": username,
        "score": score,
        "url": url,
      };
}
