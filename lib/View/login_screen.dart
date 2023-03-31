import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tipster/Controller/LoginController.dart';
import 'package:tipster/View/forgot_password_flow/forgot_password.dart';
import 'package:tipster/View/home_screen_logged_id.dart';
import 'package:tipster/View/landing_screen.dart';
import 'package:tipster/View/signup_screen.dart';
import 'package:tipster/constants/widgets/commonBtn.dart';
import 'package:tipster/constants/widgets/signUpAppBar.dart';
import 'package:tipster/utils/colors.dart';
import '../Models/LoginModel.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = LoginController();
  late LoginModel loginModel;
  bool? value = false;
  bool passenable = true; //boolean value to track password view enable disable.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonSignUpAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: appThemeBlue,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close,
                          color: appThemeBlue,
                          size: 35,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                commonSizedbox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: appThemeBlue),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: appThemeBlue),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: appThemeBlue),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.apple,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                commonSizedbox(),
                Center(
                    child: Text(
                  'or',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email Address',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            child: TextField(
                              controller: loginController.email,
                              maxLines: 1,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 6),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.circular(7)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appThemeBlue, width: 1.0),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            child: TextField(
                              controller: loginController.password,
                              maxLines: 1,
                              obscureText: passenable,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (passenable) {
                                        //if passenable == true, make it false
                                        passenable = false;
                                      } else {
                                        passenable =
                                            true; //if passenable == false, make it true
                                      }
                                    });
                                  },
                                  child: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      passenable == true
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                fillColor: Colors.white,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 6),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.circular(7)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appThemeBlue, width: 1.0),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(appThemeBlue),
                                  value: this.value,
                                  onChanged: (bool? v) {
                                    setState(() {
                                      this.value = v;
                                    });
                                  }),
                              Text('Remember me')
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          loginController.myLogin(context).then((value) {
                            loginModel = value;
                            print(value.msg);
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomeScreenLogIn()));
                        },
                        child: Text('LOG IN'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(appThemeBlue)),
                      ),
                      commonSizedbox(),
                      Text('Don\'t have an account?'),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black.withOpacity(0.7)),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
