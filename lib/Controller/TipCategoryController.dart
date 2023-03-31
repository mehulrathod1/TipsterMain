import 'package:flutter/cupertino.dart';
import 'package:tipster/Models/TipCategoryModel.dart';

import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../utils/Globles.dart';

class TipCategoryController {
  Future<TipCategoryModel> getCategory(BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.getTipCategory,
        params: {'user_id': Globles.userId});
    return TipCategoryModel.fromJson(response);
  }
}
