import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Models/SportsModel.dart';
import '../Network/ApiConstant.dart';
import '../Network/ApiGetClient.dart';

class SportController {
  Future<SportsModel> getSport(BuildContext context) async {
    var response = await getData(PARAM_URL: ApiConstant.sports);

    // final jsonMap = json.decode(response);
    // List<SportsModel> temp = (jsonMap['data'] as List)
    //     .map((itemWord) => SportsModel.fromJson(itemWord))
    //     .toList();
    //
    // List<SportsModel> ttemp = (jsonMap['data'] as List)
    //     .map((itemWord) => SportsModel.fromJson(itemWord))
    //     .toList();

    return SportsModel.fromJson(response[0]);

    // return result;
  }
}
