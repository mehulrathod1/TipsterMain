import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.userId,
    required this.firstName,
    required this.surname,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.countryName,
  });

  int userId;
  String firstName;
  String surname;
  String address;
  String phoneNumber;
  String email;
  String countryName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        firstName: json["first_name"],
        surname: json["surname"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        countryName: json["country_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "surname": surname,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
        "country_name": countryName,
      };
}
