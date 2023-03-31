// To parse this JSON data, do
//
//     final walletHistory = walletHistoryFromJson(jsonString);

import 'dart:convert';

WalletHistoryModel walletHistoryFromJson(String str) =>
    WalletHistoryModel.fromJson(json.decode(str));

String walletHistoryToJson(WalletHistoryModel data) =>
    json.encode(data.toJson());

class WalletHistoryModel {
  WalletHistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<HistoryData> data;

  factory WalletHistoryModel.fromJson(Map<String, dynamic> json) =>
      WalletHistoryModel(
        status: json["status"],
        message: json["message"],
        data: List<HistoryData>.from(
            json["data"].map((x) => HistoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HistoryData {
  HistoryData({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.tranId,
    required this.paymentMethod,
    required this.status,
    required this.created,
  });

  int id;
  int userId;
  String type;
  int amount;
  String tranId;
  String paymentMethod;
  String status;
  DateTime created;

  factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        amount: json["amount"],
        tranId: json["tran_id"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "amount": amount,
        "tran_id": tranId,
        "payment_method": paymentMethod,
        "status": status,
        "created": created.toIso8601String(),
      };
}
