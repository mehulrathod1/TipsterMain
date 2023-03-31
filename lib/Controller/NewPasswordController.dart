import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipster/View/login_screen.dart';

import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../View/forgot_password_flow/re-enter_password.dart';
import '../utils/ProgressView.dart';

class NewPasswordController {
  TextEditingController email = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  void clearControllers() {
    email.clear();
    newPassword.clear();
  }

  password(String email, BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();
    var response = await PostData(
        PARAM_URL: ApiConstant.newPassword,
        params: {'email': email.toString(), 'new_password': newPassword.text});

    loader.dismiss();

    if (response['status'] == '1') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));

      Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => LoginScreen()))
          .then((value) {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }

    return response;
  }
}
