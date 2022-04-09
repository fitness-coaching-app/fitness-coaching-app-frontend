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
  List<Result> results;

  factory HomeSection.fromJson(Map<String, dynamic> json) => HomeSection(
        code: json["code"],
        message: json["message"],
        error: json["error"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "error": error,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
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
  List<Datum> data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        sectionType: json["sectionType"],
        useUserData: json["useUserData"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sectionType": sectionType,
        "useUserData": useUserData,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.picture,
    this.onClickAction,
    this.courseId,
  });

  String? picture;
  String? onClickAction;
  String? courseId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        picture: json["picture"] ?? '',
        onClickAction: json["onClickAction"] ?? '',
        courseId: json["courseId"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "picture": picture == null ? null : picture,
        "onClickAction": onClickAction == null ? null : onClickAction,
        "courseId": courseId == null ? null : courseId,
      };
}
