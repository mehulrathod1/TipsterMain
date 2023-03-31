import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/LoginModel.dart';
import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../View/forgot_password_flow/recovery_code.dart';
import '../View/home_screen_logged_id.dart';
import '../utils/ProgressView.dart';

class ForgotPasswordController {
  TextEditingController email = TextEditingController();
  late String mail;

  void clearControllers() {
    email.clear();
  }

  forgotPassword(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();
    var response = await PostData(
        PARAM_URL: ApiConstant.forgotPassword, params: {'email': email.text});

    loader.dismiss();

    if (response['status'] == '1') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));

      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => RecoveryCode(
                    text: email.text,
                  ))).then((value) {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }

    return response;
  }
}
