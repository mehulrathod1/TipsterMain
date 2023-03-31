import 'package:flutter/material.dart';

import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../View/login_screen.dart';
import '../utils/ProgressView.dart';

class RegisterController {
  TextEditingController subDomain = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void clearControllers() {
    email.clear();
    subDomain.clear();
    name.clear();
    password.clear();
  }

  register(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();
    var response = await PostData(PARAM_URL: ApiConstant.register, params: {
      'subdomain_name': subDomain.text,
      'first_name': name.text,
      'email': email.text,
      'password': password.text
    });

    loader.dismiss();

    if (response['status'] == '1') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }

    return response;
  }
}
