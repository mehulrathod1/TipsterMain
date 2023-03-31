import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../utils/colors.dart';

Future showDepositPopup(BuildContext context) async {
  String? gender;
  bool checkBoxValue = false;
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AlertDialog(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(15),

              // To display the title it is optional
              content: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: appThemeBlue,
                      child: Center(
                        child: Text(
                          'DEPOSIT',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 16, left: 8, right: 8),
                      child: Text(
                        "your balance is not enough. you need to deposit before purchasing",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Current Balance:'))),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('55€'),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Deposit Amount(EUR):'))),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '55',
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.only(left: 4),
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
                              )),
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Payment method:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile(
                                // fillColor: MaterialStateProperty.all(
                                //     appThemeBlue),

                                activeColor: appThemeBlue,
                                title: Text(
                                  "Card",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: "Card",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                activeColor: appThemeBlue,
                                title: Text("Paypal",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                value: "Paypal",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                activeColor: appThemeBlue,
                                title: Text("Skrill",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                value: "Skrill",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkBoxValue,
                          fillColor: MaterialStateProperty.all(appThemeBlue),
                          onChanged: (v) {
                            setState(() {
                              checkBoxValue = v!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                              "I aknowledge that i read and agree with the Wallwet Rulles"),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appThemeBlue),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Message which will be pop up on the screen
              // Action widget which will provide the user to acknowledge the choice
            ),
          );
        });
      });
}
