// To parse this JSON data, do
//
//     final walletBalanceModel = walletBalanceModelFromJson(jsonString);

import 'dart:convert';

WalletBalanceModel walletBalanceModelFromJson(String str) =>
    WalletBalanceModel.fromJson(json.decode(str));

String walletBalanceModelToJson(WalletBalanceModel data) =>
    json.encode(data.toJson());

class WalletBalanceModel {
  WalletBalanceModel({
    required this.status,
    required this.msg,
    required this.user,
  });

  String status;
  String msg;
  User user;

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      WalletBalanceModel(
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
    required this.walletAmount,
  });

  int id;
  int walletAmount;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        walletAmount: json["wallet_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wallet_amount": walletAmount,
      };
}
