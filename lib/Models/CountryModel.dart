import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<CountryModelData> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        data: List<CountryModelData>.from(
            json["data"].map((x) => CountryModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CountryModelData {
  CountryModelData({
    required this.countryId,
    required this.countryName,
  });

  int countryId;
  String countryName;

  factory CountryModelData.fromJson(Map<String, dynamic> json) =>
      CountryModelData(
        countryId: json["CountryId"],
        countryName: json["countryName"],
      );

  Map<String, dynamic> toJson() => {
        "CountryId": countryId,
        "countryName": countryName,
      };
}
