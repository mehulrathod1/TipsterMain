import 'package:flutter/cupertino.dart';
import '../Models/GetBetModel.dart';
import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../utils/Globles.dart';

class BetController {
  Future<GetBetModel> getBets(BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.getBets, params: {'user_id': Globles.userId});

    return GetBetModel.fromJson(response);
  }
}
