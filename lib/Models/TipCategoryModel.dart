// To parse this JSON data, do
//
//     final tipCategoryModel = tipCategoryModelFromJson(jsonString);

import 'dart:convert';

TipCategoryModel tipCategoryModelFromJson(String str) =>
    TipCategoryModel.fromJson(json.decode(str));

String tipCategoryModelToJson(TipCategoryModel data) =>
    json.encode(data.toJson());

class TipCategoryModel {
  TipCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<TipCategoryData> data;

  factory TipCategoryModel.fromJson(Map<String, dynamic> json) =>
      TipCategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<TipCategoryData>.from(
            json["data"].map((x) => TipCategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TipCategoryData {
  TipCategoryData({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory TipCategoryData.fromJson(Map<String, dynamic> json) =>
      TipCategoryData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
