import 'package:flutter/cupertino.dart';

import '../Models/GetSportsModel.dart';
import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../utils/Globles.dart';

class SportsController {
  Future<GetSportsModel> getSports(BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.getSports, params: {'user_id': Globles.userId});

    return GetSportsModel.fromJson(response);
  }
}
