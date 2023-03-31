import 'package:flutter/cupertino.dart';

import '../Models/MarketModel.dart';
import '../Network/ApiConstant.dart';
import '../Network/ApiGetClient.dart';

class MarketController {
  Future<B> getMarket(BuildContext context) async {
    var response = await getData(PARAM_URL: ApiConstant.market);

    // var jsonData = jsonDecode(response.body) as List;

    return B.fromJson(response[0]);
    // return result;
  }
}
