import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipster/Models/WalletBalanceModel.dart';
import 'package:tipster/Models/WalletHistoryModel.dart';

import '../Network/ApiClient.dart';
import '../Network/ApiConstant.dart';
import '../utils/Globles.dart';
import '../utils/ProgressView.dart';

class BalanceController {
  TextEditingController balance = TextEditingController();
  TextEditingController depositAmount = TextEditingController();
  TextEditingController withdrawalAmount = TextEditingController();

  Future<WalletBalanceModel> getWalletBalance(BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.walletBalance,
        params: {'user_id': Globles.userId});

    return WalletBalanceModel.fromJson(response);
  }

  Future<void> depositWalletBalance(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();

    var response =
        await PostData(PARAM_URL: ApiConstant.depositBalance, params: {
      'user_id': Globles.userId,
      'amount': depositAmount.text,
      'payment_method ': "Paypal"
    });

    loader.dismiss();

    if (response['status'] == '1') {
      print('-=========>>>>>' + response['msg']);
      // Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    } else {
      print('-=========>>>>>' + response['msg']);
      // Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }
  }

  Future<void> withdrawalWalletBalance(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();

    var response =
        await PostData(PARAM_URL: ApiConstant.withdrawalBalance, params: {
      'user_id': Globles.userId,
      'amount': withdrawalAmount.text,
      'payment_method ': "Paypal"
    });

    loader.dismiss();

    if (response['status'] == '1') {
      print('-=========>>>>>' + response['msg']);
      // Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    } else {
      print('-=========>>>>>' + response['msg']);
      // Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['msg']),
        duration: Duration(seconds: 1),
      ));
    }
  }

  Future<WalletHistoryModel> getWalletHistory(BuildContext context) async {
    var response = await PostData(
        PARAM_URL: ApiConstant.walletHistory,
        params: {'user_id': Globles.userId});

    print(response);

    return WalletHistoryModel.fromJson(response);
  }
}
