import 'package:flutter/material.dart';
import 'package:tipster/View/BUYER%20ADMIN/buyer_admin_susbscription.dart';
import 'package:tipster/View/BUYER%20ADMIN/buyer_admin_transactions.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_earnings.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_fees.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_settings.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_subscribers.dart';
import 'package:tipster/View/WALLET/wallet_deposit_screen.dart';
import 'package:tipster/View/WALLET/wallet_history_screen.dart';
import 'package:tipster/View/WALLET/wallet_withdraw_screen.dart';
import 'package:tipster/utils/colors.dart';

Future buyerAdminDialog(BuildContext context) async {
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
                  'BUYER ADMIN',
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
                            builder: (context) => BuyerAdminSubscriptions()));
                  },
                  child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('SUBSCRIPTIONS'),
                      )))),
              Divider(
                height: 0,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyerAdminTransactions()));
                  },
                  child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('TRANSACTIONS'),
                      )))),
            ],
          ),
        );
      });
}
