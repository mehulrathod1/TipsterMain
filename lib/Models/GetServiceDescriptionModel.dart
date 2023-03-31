// To parse this JSON data, do
//
//     final getServiceDescriptionModel = getServiceDescriptionModelFromJson(jsonString);

import 'dart:convert';

GetServiceDescriptionModel getServiceDescriptionModelFromJson(String str) =>
    GetServiceDescriptionModel.fromJson(json.decode(str));

String getServiceDescriptionModelToJson(GetServiceDescriptionModel data) =>
    json.encode(data.toJson());

class GetServiceDescriptionModel {
  GetServiceDescriptionModel({
    required this.status,
    required this.msg,
    required this.user,
  });

  String status;
  String msg;
  User user;

  factory GetServiceDescriptionModel.fromJson(Map<String, dynamic> json) =>
      GetServiceDescriptionModel(
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
    required this.serviceDesc,
  });

  int id;
  String serviceDesc;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        serviceDesc: json["service_desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_desc": serviceDesc,
      };
}
