import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tipster/Controller/RegisterController.dart';
import 'package:tipster/View/login_screen.dart';
import 'package:tipster/constants/widgets/commonBtn.dart';
import 'package:tipster/constants/widgets/signUpAppBar.dart';
import 'package:tipster/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegisterController _controller = RegisterController();

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool termsandcond = false;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool passenable = true;
  bool passenable1 = true;

  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonSignUpAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
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
                            'SIGN UP',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Subdomain ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: _controller.subDomain,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 6),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appThemeBlue, width: 1.0),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '.webname.com',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      commonSizedbox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Display Name ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: _controller.name,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 6),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appThemeBlue, width: 1.0),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                        ],
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
                      commonSizedbox(),
                      Column(
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
                                  controller: _controller.email,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 6),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
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
                          commonSizedbox(),
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
                                child: TextFormField(
                                  obscureText: passenable,
                                  controller: _controller.password,
                                  maxLines: 1,

                                  // ------
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please enter password";
                                  //   } else {
                                  //     //call function to check password
                                  //     bool result = validatePassword(value);
                                  //     if (result) {
                                  //       // create account event
                                  //       return null;
                                  //     } else {
                                  //       return " Password should contain Capital, small letter & Number & Special";
                                  //     }
                                  //   }
                                  // },
                                  // ----

                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.allow(RegExp(
                                  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')),
                                  // ],

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
                                        borderSide: const BorderSide(
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
                          commonSizedbox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Confirm Password',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                child: TextField(
                                  maxLines: 1,
                                  obscureText: passenable1,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (passenable1) {
                                            //if passenable == true, make it false
                                            passenable1 = false;
                                          } else {
                                            passenable1 =
                                                true; //if passenable == false, make it true
                                          }
                                        });
                                      },
                                      child: Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          passenable1 == true
                                              ? Icons.remove_red_eye
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 6),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
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
                          commonSizedbox(),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    children: [
                      Checkbox(
                          value: termsandcond,
                          fillColor: MaterialStateProperty.all(appThemeBlue),
                          onChanged: (v) {
                            setState(() {
                              termsandcond = v!;
                            });
                          }),
                      Expanded(
                          child: Text(
                        'I agree with the Terms&Conditions and Privacy Policy  ',
                        style: TextStyle(fontSize: 12),
                      ))
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      _controller.register(context);
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          color: Color(0xffFD5A77)),
                    )),
                commonSizedbox(),
                Text('Already have an account?',
                    style: TextStyle(
                      fontSize: 12,
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          color: Color(0xffFD5A77)),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
