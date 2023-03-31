import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Models/BookmarkModel.dart';
import '../Models/GetBetModel.dart';
import '../Network/ApiConstant.dart';
import '../Network/ApiGetClient.dart';

class BookmarkController {
  Future<List> getBookmark(BuildContext context) async {
    var response = await getData(PARAM_URL: ApiConstant.bookmakers);

    var tagsJson = (response);
    List<dynamic>? tags = tagsJson != null ? List.from(tagsJson) : null;

    print(">> " + tags![0]["name"]);
    print(">> " + tags[1]["name"]);

    return tags;

    // return response.map((x) => GetBets.fromJson(x));

    // return result;
  }

  Future<List> getSportData(BuildContext context, String id) async {
    var response = await getData(PARAM_URL: id + ApiConstant.sports);
    var tagsJson = (response);
    List<dynamic>? tags;
    tags?.clear();
    tags = tagsJson != null ? List.from(tagsJson) : null;

    print(">> " + tags![3]["name"]);
    print(">> " + tags[4]["name"]);

    return tags;

    // return response.map((x) => GetBets.fromJson(x));

    // return result;
  }

  Future<List> getCompetitionData(
      BuildContext context, String id, String sportId) async {
    var response =
        await getData(PARAM_URL: id + '/' + sportId + ApiConstant.competitions);
    var tagsJson = (response);
    List<dynamic>? tags = tagsJson != null ? List.from(tagsJson) : null;

    print(">> " + tags![0]["name"]);
    print(">> " + tags[1]["name"]);

    return tags;

    // return response.map((x) => GetBets.fromJson(x));

    // return result;
  }

  Future<List> getMarketData(BuildContext context, String eventId) async {
    var response =
        await getData(PARAM_URL: "4/131506/75/" + eventId + ApiConstant.market);
    var tagsJson = (response);
    List<dynamic>? tags = tagsJson != null ? List.from(tagsJson) : null;

    print(">> " + tags![0]["N"]);
    print(">> " + tags[1]["N"]);

    return tags;

    // return response.map((x) => GetBets.fromJson(x));
    // return result;
  }

  Future<List?> getBetsData(
      BuildContext context, String eventId, String marketId) async {
    var response = await getData(
        PARAM_URL:
            "4/131506/75/" + eventId + "/" + marketId + ApiConstant.bets);
    var tagsJson = (response);
    List<dynamic>? tags = tagsJson != null ? List.from(tagsJson) : null;

    // print(">> " + tags![0]["N"]);
    // / print(">> " + tags[1]["N"]);

    return tags;

    // return response.map((x) => GetBets.fromJson(x));
    // return result;
  }

  Future<List?> getEventData(BuildContext context) async {
    var response = await getData(PARAM_URL: ApiConstant.events);
    var tagsJson = (response);
    List<dynamic>? tags = tagsJson != null ? List.from(tagsJson) : null;

    // print(">> " + tags![0]["N"]);
    // / print(">> " + tags[1]["N"]);

    return tags;

    // return response.map((x) => GetBets.fromJson(x));

    // return result;
  }
}
