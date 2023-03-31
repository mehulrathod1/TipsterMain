// To parse this JSON data, do
//
//     final getBetModel = getBetModelFromJson(jsonString);

import 'dart:convert';

GetBetModel getBetModelFromJson(String str) =>
    GetBetModel.fromJson(json.decode(str));

String getBetModelToJson(GetBetModel data) => json.encode(data.toJson());

class GetBetModel {
  GetBetModel({
    required this.status,
    required this.message,
    required this.data,
  });
  String status;
  String message;
  List<GetBets> data;
  factory GetBetModel.fromJson(Map<String, dynamic> json) => GetBetModel(
        status: json["status"],
        message: json["message"],
        data: List<GetBets>.from(json["data"].map((x) => GetBets.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetBets {
  GetBets({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GetBets.fromJson(Map<String, dynamic> json) => GetBets(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
