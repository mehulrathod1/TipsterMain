import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipster/View/home_screen.dart';
import 'package:tipster/View/home_screen_logged_id.dart';
import 'package:tipster/utils/Globles.dart';

import '../utils/colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Timer timer;

  Future<void> navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('user_id', response['user']['id']);
    // await prefs.clear();
    Globles.userId = prefs.get('user_id').toString();
    print(Globles.userId);

    Timer(
        Duration(seconds: 3),
        () => (prefs.get('user_id').toString() == null.toString())
            ? Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreenLogIn())));
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appThemeBlue),
      child: Center(
        child: Container(
          child: Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
