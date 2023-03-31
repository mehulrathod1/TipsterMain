import 'package:flutter/material.dart';
import 'package:tipster/View/WALLET/wallet_deposit_screen.dart';
import 'package:tipster/View/WALLET/wallet_history_screen.dart';
import 'package:tipster/View/WALLET/wallet_withdraw_screen.dart';
import 'package:tipster/utils/colors.dart';

Future walletDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(65),
          title: Container(
              color: appThemeBlue,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'WALLET',
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
                            builder: (context) => WalletHistoryScreen()));
                  },
                  child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('HISTORY'),
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
                            builder: (context) => WalletDepositScreen()));
                  },
                  child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('DEPOSIT'),
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
                            builder: (context) => WalletWithdrawScreen()));
                  },
                  child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('WITHDRAW'),
                      )))),
            ],
          ),
        );
      });
}
