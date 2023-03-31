// To parse this JSON data, do
//
//     final getSportsModel = getSportsModelFromJson(jsonString);

import 'dart:convert';

GetSportsModel getSportsModelFromJson(String str) =>
    GetSportsModel.fromJson(json.decode(str));

String getSportsModelToJson(GetSportsModel data) => json.encode(data.toJson());

class GetSportsModel {
  GetSportsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<GetSportData> data;

  factory GetSportsModel.fromJson(Map<String, dynamic> json) => GetSportsModel(
        status: json["status"],
        message: json["message"],
        data: List<GetSportData>.from(
            json["data"].map((x) => GetSportData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetSportData {
  GetSportData({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GetSportData.fromJson(Map<String, dynamic> json) => GetSportData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
