import 'package:flutter/cupertino.dart';

import '../Models/CompetitionsModel.dart';
import '../Network/ApiConstant.dart';
import '../Network/ApiGetClient.dart';

class CompetitionController {
  Future<CompetitionsModel> getCompetition(BuildContext context) async {
    var response = await getData(PARAM_URL: ApiConstant.competitions);

    // var jsonData = jsonDecode(response.body) as List;

    return CompetitionsModel.fromJson(response[0]);
    // return result;
  }
}
