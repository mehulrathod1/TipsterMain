// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.msg,
    required this.user,
  });

  String status;
  String msg;
  User user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.subdomainName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.countryName,
    required this.languageId,
    required this.oldStyle,
    required this.currency,
    required this.status,
    required this.emailOtp,
    required this.created,
  });

  int id;
  String subdomainName;
  String firstName;
  String lastName;
  String email;
  String password;
  String profilePicture;
  String countryName;
  String languageId;
  String oldStyle;
  String currency;
  String status;
  String emailOtp;
  DateTime created;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        subdomainName: json["subdomain_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        profilePicture: json["profile_picture"],
        countryName: json["country_name"],
        languageId: json["language_id"],
        oldStyle: json["old_style"],
        currency: json["currency"],
        status: json["status"],
        emailOtp: json["email_otp"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subdomain_name": subdomainName,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "profile_picture": profilePicture,
        "country_name": countryName,
        "language_id": languageId,
        "old_style": oldStyle,
        "currency": currency,
        "status": status,
        "email_otp": emailOtp,
        "created": created.toIso8601String(),
      };
}
