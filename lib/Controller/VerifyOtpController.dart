import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../View/forgot_password_flow/re-enter_password.dart';
import '../View/forgot_password_flow/recovery_code.dart';
import '../utils/ProgressView.dart';

class VerifyOtpController {
  TextEditingController otp = TextEditingController();

  void clearControllers() {
    otp.clear();
  }

  verifyOtp(String email, BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();
    var response = await PostData(
        PARAM_URL: ApiConstant.verifyOtp,
        params: {'email': email, 'otp': otp.text});

    loader.dismiss();

    if (response['status'] == '1') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));

      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => ReEnterPassword(
                    email: email.toString(),
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
