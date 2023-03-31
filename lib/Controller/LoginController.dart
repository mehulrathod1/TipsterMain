import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipster/Models/LoginModel.dart';
import 'package:tipster/Network/ApiClient.dart';
import 'package:tipster/Network/ApiConstant.dart';
import 'package:tipster/View/signup_screen.dart';
import 'package:tipster/utils/ProgressView.dart';

import '../View/home_screen_logged_id.dart';

class LoginController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void clearControllers() {
    email.clear();
    password.clear();
  }

  Future<LoginModel> myLogin(BuildContext context) async {
    late LoginModel loginModel;

    var loader = ProgressView(context);
    loader.show();
    var response = await PostData(
        PARAM_URL: ApiConstant.login,
        params: {'email': email.text, 'password': password.text});

    loader.dismiss();

    if (response['status'] == '1') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('user_id', response['user']['id']);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));

      Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => HomeScreenLogIn()))
          .then((value) {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }

    return LoginModel.fromJson(response);
  }
}
