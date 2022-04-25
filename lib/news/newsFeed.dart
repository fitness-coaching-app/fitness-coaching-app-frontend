// To parse this JSON data, do
//
//     final newsFeed = newsFeedFromJson(jsonString);

import 'dart:convert';

NewsFeed newsFeedFromJson(String str) => NewsFeed.fromJson(json.decode(str));

String newsFeedToJson(NewsFeed data) => json.encode(data.toJson());

class NewsFeed {
  NewsFeed({
    required this.results,
  });

  List<Result> results;

  factory NewsFeed.fromJson(Map<String, dynamic> json) => NewsFeed(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.newsHeader,
    required this.newsDetails,
    required this.likes,
    required this.picture,
    required this.onClickAction,
  });

  String newsHeader;
  String newsDetails;
  int likes;
  String picture;
  String onClickAction;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        newsHeader: json["newsHeader"],
        newsDetails: json["newsDetails"],
        likes: json["likes"],
        picture: json["picture"],
        onClickAction: json["onClickAction"],
      );

  Map<String, dynamic> toJson() => {
        "newsHeader": newsHeader,
        "newsDetails": newsDetails,
        "likes": likes,
        "picture": picture,
        "onClickAction": onClickAction,
      };
}
