// To parse this JSON data, do
//
//     final marketModel = marketModelFromJson(jsonString);

import 'dart:convert';

List<MarketModel> marketModelFromJson(String str) => List<MarketModel>.from(
    json.decode(str).map((x) => MarketModel.fromJson(x)));

String marketModelToJson(List<MarketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarketModel {
  MarketModel({
    required this.id,
    required this.n,
    required this.lu,
    required this.b,
  });

  int id;
  String n;
  DateTime lu;
  List<B> b;

  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
        id: json["ID"],
        n: json["N"],
        lu: DateTime.parse(json["LU"]),
        b: List<B>.from(json["B"].map((x) => B.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "N": n,
        "LU": lu.toIso8601String(),
        "B": List<dynamic>.from(b.map((x) => x.toJson())),
      };
}

class B {
  B({
    required this.id,
    required this.n,
    required this.s,
    required this.sp,
    required this.pr,
    required this.st,
    required this.lu,
    required this.processedAt,
    required this.li,
    required this.bl,
  });

  double id;
  String n;
  int s;
  String sp;
  String pr;
  int st;
  DateTime lu;
  DateTime processedAt;
  String li;
  String bl;

  factory B.fromJson(Map<String, dynamic> json) => B(
        id: json["ID"].toDouble(),
        n: json["N"],
        s: json["S"],
        sp: json["SP"],
        pr: json["PR"],
        st: json["ST"],
        lu: DateTime.parse(json["LU"]),
        processedAt: DateTime.parse(json["ProcessedAt"]),
        li: json["LI"] == null ? null : json["LI"],
        bl: json["BL"] == null ? null : json["BL"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "N": n,
        "S": s,
        "SP": sp,
        "PR": pr,
        "ST": st,
        "LU": lu.toIso8601String(),
        "ProcessedAt": processedAt.toIso8601String(),
        "LI": li == null ? null : li,
        "BL": bl == null ? null : bl,
      };
}
