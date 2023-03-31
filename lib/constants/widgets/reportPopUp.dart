import 'package:flutter/material.dart';
import 'package:tipster/utils/colors.dart';

Future serviceDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: appThemelightPink,
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                      child: Text(
                        'CANCEL',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: appThemeteal,
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ],
          insetPadding: EdgeInsets.all(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: appThemeBlue,
                height: 40,
                width: double.infinity,
                child: Center(
                    child: Text(
                  'CHANGE SERVICE DESCRIPTION',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      color: Color(0xffEAEAEA),
                      width: double.maxFinite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'B /',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 7,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Provide Information about your service',
                        hintStyle:
                            TextStyle(color: Color(0xff828080), fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: appThemeBlue, width: 1.0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
