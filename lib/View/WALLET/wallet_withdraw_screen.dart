import 'package:flutter/material.dart';
import 'package:tipster/View/change_personal_details_screen.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/wallet_popup_widget.dart';
import 'package:tipster/utils/colors.dart';

import '../../Controller/BalanceController.dart';
import '../../Models/WalletBalanceModel.dart';

class WalletWithdrawScreen extends StatefulWidget {
  WalletWithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WalletWithdrawScreen> createState() => _WalletWithdrawScreenState();
}

class _WalletWithdrawScreenState extends State<WalletWithdrawScreen> {
  bool acknowledgeBool = false;

  BalanceController balanceController = BalanceController();
  late WalletBalanceModel walletBalanceModel;
  late User userBalance;
  String? balance;

  Future initialize(BuildContext context) async {
    balanceController.getWalletBalance(context).then((value) {
      setState(() {
        walletBalanceModel = value;
        userBalance = value.user;
        balanceController.balance.text = value.user.walletAmount.toString();
        balance = value.user.walletAmount.toString() + ' €';
      });
    });
  }

  @override
  void initState() {
    initialize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0))),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: appThemeBlue,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'WALLET',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            balance.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            walletDialog(context);
                          },
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: appThemeBlue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text(
                                    'WITHDRAW',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Withdraw amount (EUR):',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: balanceController.withdrawalAmount,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: appThemeBlue, width: 1.0),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Choose account:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: '1',
                                          fillColor: MaterialStateProperty.all(
                                              appThemeBlue),
                                          groupValue: '1',
                                          onChanged: (v) {}),
                                      Text('Bank account'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: '1',
                                          fillColor: MaterialStateProperty.all(
                                              appThemeBlue),
                                          groupValue: '1',
                                          onChanged: (v) {}),
                                      Text('PayPal'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: '1',
                                          fillColor: MaterialStateProperty.all(
                                              appThemeBlue),
                                          groupValue: '1',
                                          onChanged: (v) {}),
                                      Text('Skrill'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: acknowledgeBool,
                              activeColor: appThemeBlue,
                              onChanged: (v) {
                                setState(() {
                                  acknowledgeBool = v!;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(appThemeBlue),
                            ),
                            Expanded(
                              child: Text(
                                  'I acknowledge that I read and agree with the wallet Rules'),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                balanceController
                                    .withdrawalWalletBalance(context);
                              },
                              child: Text('Withdraw'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(appThemeBlue)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CommonBottomWidget()
        ],
      ),
    );
  }
}
