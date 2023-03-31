import 'package:flutter/material.dart';
import 'package:tipster/View/home_screen.dart';
import 'package:tipster/View/signup_screen.dart';
import 'View/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffEAEAEA),
          unselectedWidgetColor: Color(0xff0b65bf)),
      home: Splash(),
    );
  }
}
