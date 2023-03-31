// To parse this JSON data, do
//
//     final sportsModel = sportsModelFromJson(jsonString);

import 'dart:convert';

List<SportsModel> productFromJson(String str) => List<SportsModel>.from(
    json.decode(str).map((x) => SportsModel.fromJson(x)));

String productToJson(List<SportsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SportsModel {
  SportsModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
