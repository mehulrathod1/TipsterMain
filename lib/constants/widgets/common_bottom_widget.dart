import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tipster/utils/colors.dart';

class CommonBottomWidget extends StatelessWidget {
  CommonBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'TIP & WIN',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text('ALL RIGHTS RESERVED @2022'),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: appThemeBlue, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: appThemeBlue, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: appThemeBlue, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Terms & Conditions',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
