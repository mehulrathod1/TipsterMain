import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipster/Network/ApiClient.dart';
import 'package:tipster/Network/ApiConstant.dart';
import 'package:tipster/utils/Globles.dart';

import '../Models/GetProfileModel.dart';
import '../utils/ProgressView.dart';

class GetProfileController {
  TextEditingController userId = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController countryName = TextEditingController();

  Future<void> submit(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();

    var response =
        await PostData(PARAM_URL: ApiConstant.updateProfile, params: {
      'user_id': Globles.userId,
      'name': firstname.text,
      'surname': surname.text,
      'address': address.text,
      'phone_number': phoneNumber.text,
      'country_name': "india"
    });

    loader.dismiss();
    if (response['status'] == '1') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }
  }

  Future<GetProfileModel> getProfile(BuildContext context) async {
    // var loader = ProgressView(context);
    // loader.show();

    // print('-=========>>>>>' + user_id);

    var response = await PostData(
        PARAM_URL: ApiConstant.getProfile, params: {'user_id': Globles.userId});

    print('-=========>>>>>' + response['message']);

    // loader.dismiss();
    // if (response['status'] == '1') {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(response['msg']),
    //     duration: Duration(seconds: 1),
    //   ));
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(response['msg']),
    //     duration: Duration(seconds: 1),
    //   ));
    // }

    return GetProfileModel.fromJson(response);
  }
}
