// To parse this JSON data, do
//
//     final homeSection = homeSectionFromJson(jsonString);

import 'dart:convert';

HomeSection homeSectionFromJson(String str) =>
    HomeSection.fromJson(json.decode(str));

String homeSectionToJson(HomeSection data) => json.encode(data.toJson());

class HomeSection {
  HomeSection({
    required this.code,
    required this.message,
    required this.error,
    required this.results,
  });

  int code;
  String message;
  bool error;
  List<Result>? results;

  factory HomeSection.fromJson(Map<String, dynamic> json) => HomeSection(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"] == null ? null : json["error"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "error": error == null ? null : error,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.name,
    required this.sectionType,
    required this.useUserData,
    required this.data,
  });

  String name;
  String sectionType;
  bool useUserData;
  List<Datum>? data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        sectionType: json["sectionType"] == null ? null : json["sectionType"],
        useUserData: json["useUserData"] == null ? null : json["useUserData"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "sectionType": sectionType == null ? null : sectionType,
        "useUserData": useUserData == null ? null : useUserData,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.picture,
    required this.onClickAction,
    required this.courseId,
    required this.name,
    required this.difficulty,
    required this.coverPicture,
    required this.overallRating,
  });

  String? picture;
  String? onClickAction;

  String? courseId;
  String? name;
  String? difficulty;
  String? coverPicture;
  double? overallRating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        picture: json["picture"] == null ? null : json["picture"],
        onClickAction:
            json["onClickAction"] == null ? null : json["onClickAction"],
        courseId: json["courseId"] == null ? null : json["courseId"],
        name: json["name"] == null ? null : json["name"],
        difficulty: json["difficulty"] == null ? null : json["difficulty"],
        coverPicture:
            json["coverPicture"] == null ? null : json["coverPicture"],
        overallRating:
            json["overallRating"] == null ? null : json["overallRating"],
      );

  Map<String, dynamic> toJson() => {
        "picture": picture == null ? null : picture,
        "onClickAction": onClickAction == null ? null : onClickAction,
        "courseId": courseId == null ? null : courseId,
        "name": name == null ? null : name,
        "difficulty": difficulty == null ? null : difficulty,
        "coverPicture": coverPicture == null ? null : coverPicture,
        "overallRating": overallRating == null ? null : overallRating,
      };
}
