import 'package:flutter/material.dart';

Widget commonBtn(
  BuildContext context,
  dynamic value,
  @required Color btnColor,
  @required Color textColor,
  @required String text,
  @required double fontsize,
  @required double borderRadius,
) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => value));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(fontSize: fontsize, color: textColor),
        ),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(btnColor)),
    ),
  );
}
Widget commonSizedbox() => SizedBox(
  height: 10,
);
