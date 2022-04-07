// To parse this JSON data, do
//
//     final activityFeed = activityFeedFromJson(jsonString);

import 'dart:convert';

ActivityFeed activityFeedFromJson(String str) =>
    ActivityFeed.fromJson(json.decode(str));

String activityFeedToJson(ActivityFeed data) => json.encode(data.toJson());

class ActivityFeed {
  ActivityFeed({
    required this.results,
  });

  List<Result> results;

  factory ActivityFeed.fromJson(Map<String, dynamic> json) => ActivityFeed(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.actHeader,
    required this.actDetail,
    required this.iconUrl,
    required this.username,
    required this.urls,
    required this.likes,
    required this.comments,
    required this.picture,
    required this.onClickAction,
  });

  String actHeader;
  String actDetail;
  String iconUrl;
  String username;
  String urls;
  List<Like> likes;
  List<Comment> comments;
  String picture;
  String onClickAction;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        actHeader: json["actHeader"],
        actDetail: json["actDetail"],
        iconUrl: json["iconUrl"],
        username: json["username"],
        urls: json["urls"],
        likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        picture: json["picture"],
        onClickAction: json["onClickAction"],
      );

  Map<String, dynamic> toJson() => {
        "actHeader": actHeader,
        "actDetail": actDetail,
        "iconUrl": iconUrl,
        "username": username,
        "urls": urls,
        "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "picture": picture,
        "onClickAction": onClickAction,
      };
}

class Comment {
  Comment({
    required this.commentData,
  });

  String commentData;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentData: json["commentData"],
      );

  Map<String, dynamic> toJson() => {
        "commentData": commentData,
      };
}

class Like {
  Like({
    required this.username,
  });

  String username;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
