// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.code,
    this.message,
    this.error,
    this.results,
  });

  int? code;
  String? message;
  bool? error;
  Results? results;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"] == null ? null : json["error"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "error": error == null ? null : error,
        "results": results == null ? null : results?.toJson(),
      };
}

class Results {
  Results({
    this.id,
    this.status,
    this.displayName,
    this.email,
    this.password,
    this.profilePicture,
    this.gender,
    this.partToAvoid,
    this.birthYear,
    this.exercisePreference,
  });

  String? id;
  String? status;
  String? displayName;
  String? email;
  String? password;
  String? profilePicture;
  String? gender;
  List<String>? partToAvoid;
  int? birthYear;
  List<String>? exercisePreference;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["_id"] == null ? null : json["_id"],
        status: json["status"] == null ? null : json["status"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        profilePicture:
            json["profilePicture"] == null ? null : json["profilePicture"],
        gender: json["gender"] == null ? null : json["gender"],
        partToAvoid: json["partToAvoid"] == null
            ? null
            : List<String>.from(json["partToAvoid"].map((x) => x)),
        birthYear: json["birthYear"] == null ? null : json["birthYear"],
        exercisePreference: json["exercisePreference"] == null
            ? null
            : List<String>.from(json["exercisePreference"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "status": status == null ? null : status,
        "displayName": displayName == null ? null : displayName,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "profilePicture": profilePicture == null ? null : profilePicture,
        "gender": gender == null ? null : gender,
        "partToAvoid": partToAvoid == null
            ? null
            : List<dynamic>.from(partToAvoid!.map((x) => x)),
        "birthYear": birthYear == null ? null : birthYear,
        "exercisePreference": exercisePreference == null
            ? null
            : List<dynamic>.from(exercisePreference!.map((x) => x)),
      };
}
