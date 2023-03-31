// To parse this JSON data, do
//
//     final bookmarkModel = bookmarkModelFromJson(jsonString);

import 'dart:convert';

// List<GetBets>.from(json["data"].map((x) => GetBets.fromJson(x)))

class BookmarkModel {
  BookmarkModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
