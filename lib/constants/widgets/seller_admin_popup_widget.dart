import 'package:flutter/material.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_earnings.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_fees.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_settings.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_subscribers.dart';
import 'package:tipster/utils/colors.dart';

import '../../Controller/GetServiceDescriptionController.dart';

Future sellerAdminDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
              color: appThemeBlue,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SELLER ADMIN',
                  style: TextStyle(color: Colors.white),
                ),
              ))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerAdminSettings()));
                  },
                  child: Container(
                      width: double.maxFinite,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text('SETTINGS')),
                      ))),
              Divider(
                height: 0,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerAdminEarnings()));
                  },
                  child: Container(
                      width: double.maxFinite,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text('EARNINGS')),
                      ))),
              Divider(
                height: 0,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerAdminSubscribers()));
                  },
                  child: Container(
                      width: double.maxFinite,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text('SUBSCRIBERS')),
                      ))),
              Divider(
                height: 0,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerAdminFeesEarnings()));
                  },
                  child: Container(
                      width: double.maxFinite,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text('FEES & EARNINGS')),
                      ))),
            ],
          ),
        );
      });
}

Future serviceDialog(BuildContext context, String s) async {
  GetServiceDescriptionController serviceDescriptionController =
      GetServiceDescriptionController();
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
                    serviceDescriptionController.updateDescription(context);
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
                      controller: serviceDescriptionController.desc,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: s,
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
