import 'package:flutter/cupertino.dart';

import '../Models/SubscriptionPlaneModel.dart';
import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../utils/Globles.dart';

class SubscriptionPlaneController {
  TextEditingController balance = TextEditingController();
  Future<SubscriptionPlaneModel> getWalletBalance(BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.mySubscriptionPlan,
        params: {'user_id': Globles.userId});
    return SubscriptionPlaneModel.fromJson(response);
  }
}
