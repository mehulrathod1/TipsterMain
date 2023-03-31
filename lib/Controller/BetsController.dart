import 'package:flutter/cupertino.dart';

import '../Models/MarketModel.dart';
import '../Network/ApiConstant.dart';
import '../Network/ApiGetClient.dart';

class BetsController {
  Future<MarketModel> getBet(BuildContext context) async {
    var response = await getData(PARAM_URL: ApiConstant.bets);

    // var jsonData = jsonDecode(response.body) as List;

    return MarketModel.fromJson(response[0]);
  }
}
