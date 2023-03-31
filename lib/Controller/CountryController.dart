import 'package:tipster/Network/ApiClient.dart';
import 'package:tipster/Network/ApiConstant.dart';
import 'package:tipster/utils/Globles.dart';

import '../Models/CountryModel.dart';

class CountryController {
  Future<CountryModel> getCountry() async {
    var response = await PostData(
        PARAM_URL: ApiConstant.getCountry, params: {'user_id': Globles.userId});

    return CountryModel.fromJson(response);
  }
}
