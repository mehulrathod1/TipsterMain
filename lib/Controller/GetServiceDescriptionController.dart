import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/GetServiceDescriptionModel.dart';
import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../utils/Globles.dart';
import '../utils/ProgressView.dart';

class GetServiceDescriptionController {
  TextEditingController desc = TextEditingController();

  Future<GetServiceDescriptionModel> getDescription(
      BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.getServiceDescription,
        params: {'user_id': Globles.userId});

    print('-=========>>>>>' + response['msg']);

    return GetServiceDescriptionModel.fromJson(response);
  }

  Future<void> updateDescription(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();

    var response = await PostData(
        PARAM_URL: ApiConstant.updateServiceDescription,
        params: {
          'user_id': Globles.userId,
          'service_desc': desc.text,
        });

    loader.dismiss();
    if (response['status'] == '1') {
      print('-=========>>>>>' + response['msg']);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    } else {
      print('-=========>>>>>' + response['msg']);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
