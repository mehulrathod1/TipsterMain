// To parse this JSON data, do
//
//     final subscriptionPlaneModel = subscriptionPlaneModelFromJson(jsonString);

import 'dart:convert';

SubscriptionPlaneModel subscriptionPlaneModelFromJson(String str) =>
    SubscriptionPlaneModel.fromJson(json.decode(str));

String subscriptionPlaneModelToJson(SubscriptionPlaneModel data) =>
    json.encode(data.toJson());

class SubscriptionPlaneModel {
  SubscriptionPlaneModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  String status;
  String msg;
  Amount data;

  factory SubscriptionPlaneModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionPlaneModel(
        status: json["status"],
        msg: json["msg"],
        data: Amount.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Amount {
  Amount({
    required this.id,
    required this.subcriptionAmount,
  });

  int id;
  String subcriptionAmount;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        id: json["id"],
        subcriptionAmount: json["subcription_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subcription_amount": subcriptionAmount,
      };
}
