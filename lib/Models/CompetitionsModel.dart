// To parse this JSON data, do
//
//     final competitionsModel = competitionsModelFromJson(jsonString);

import 'dart:convert';

List<CompetitionsModel> competitionsModelFromJson(String str) =>
    List<CompetitionsModel>.from(
        json.decode(str).map((x) => CompetitionsModel.fromJson(x)));

String competitionsModelToJson(List<CompetitionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompetitionsModel {
  CompetitionsModel({
    required this.id,
    required this.name,
    required this.location,
  });

  int id;
  String name;
  Location location;

  factory CompetitionsModel.fromJson(Map<String, dynamic> json) =>
      CompetitionsModel(
        id: json["id"],
        name: json["name"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location.toJson(),
      };
}

class Location {
  Location({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
