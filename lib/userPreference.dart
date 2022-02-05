// To parse this JSON data, do
//
//     final userPreference = userPreferenceFromJson(jsonString);

import 'dart:convert';

UserPreference userPreferenceFromJson(String str) =>
    UserPreference.fromJson(json.decode(str));

String userPreferenceToJson(UserPreference data, String gender,
        List<String> exercisePreference, List<String> partToAvoid) =>
    json.encode(data.toJson());

class UserPreference {
  UserPreference({
    this.birthYear,
    this.gender,
    this.exercisePreference,
    this.partToAvoid,
  });

  int? birthYear;
  String? gender;
  List<String>? exercisePreference;
  List<String>? partToAvoid;

  factory UserPreference.fromJson(Map<String, dynamic> json) => UserPreference(
        birthYear: json["birthYear"] == null ? null : json["birthYear"],
        gender: json["gender"] == null ? null : json["gender"],
        exercisePreference: json["exercisePreference"] == null
            ? null
            : List<String>.from(json["exercisePreference"].map((x) => x)),
        partToAvoid: json["partToAvoid"] == null
            ? null
            : List<String>.from(json["partToAvoid"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "birthYear": birthYear == null ? null : birthYear,
        "gender": gender == null ? null : gender,
        "exercisePreference": exercisePreference == null
            ? null
            : List<dynamic>.from(exercisePreference!.map((x) => x)),
        "partToAvoid": partToAvoid == null
            ? null
            : List<dynamic>.from(partToAvoid!.map((x) => x)),
      };
}
