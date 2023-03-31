import 'package:flutter/material.dart';
import 'package:tipster/Models/WalletHistoryModel.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/wallet_popup_widget.dart';
import 'package:tipster/utils/colors.dart';

import '../../Controller/BalanceController.dart';
import '../../Models/WalletBalanceModel.dart';

class WalletHistoryScreen extends StatefulWidget {
  WalletHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WalletHistoryScreen> createState() => _WalletHistoryScreenState();
}

class _WalletHistoryScreenState extends State<WalletHistoryScreen> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  BalanceController balanceController = BalanceController();
  late WalletBalanceModel walletBalanceModel;
  late User userBalance;
  String? balance;
  List<String> filterTypeList = ["Deposit", "Withdrawal"];
  String dropdownValue = 'Deposit';
  List<String> filterStatusList = [
    "Completed",
    "Pending",
    "Cancelled",
    "Refunded"
  ];
  String dropdownStatus = 'Completed';

  late WalletHistoryModel walletHistoryModel;
  late HistoryData historyData;
  List<HistoryData> historyDataList = [];

  Future<void> _selectfromDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: fromDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appThemeBlue, // <-- SEE HERE
              // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != fromDate)
      setState(() {
        fromDate = pickedDate;
      });
  }

  Future<void> _selecttoDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: toDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2050),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: appThemeBlue, // <-- SEE HERE
                // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    // button text color
                    ),
              ),
            ),
            child: child!,
          );
        });
    if (pickedDate != null && pickedDate != toDate)
      setState(() {
        toDate = pickedDate;
      });
  }

  Future initialize(BuildContext context) async {
    balanceController.getWalletBalance(context).then((value) {
      setState(() {
        walletBalanceModel = value;
        userBalance = value.user;
        balanceController.balance.text = value.user.walletAmount.toString();
        balance = value.user.walletAmount.toString() + ' €';
      });
    });

    balanceController.getWalletHistory(context).then((value) {
      setState(() {
        walletHistoryModel = value;
        historyDataList = walletHistoryModel.data;
        print(historyDataList[0].amount);
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
                            width: 150,
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
                                    'HISTORY',
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Filter from',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(fromDate
                                                  .toString()
                                                  .substring(0, 10))),
                                          GestureDetector(
                                              onTap: () {
                                                _selectfromDate(context);
                                              },
                                              child: Icon(Icons
                                                  .calendar_today_outlined))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Filter to',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(toDate
                                                  .toString()
                                                  .substring(0, 10))),
                                          GestureDetector(
                                              onTap: () {
                                                _selectfromDate(context);
                                              },
                                              child: Icon(Icons
                                                  .calendar_today_outlined))
                                        ],
                                      ),
                                    ),
                                  )
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Filter by type',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        onChanged: (newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),

                                        dropdownColor: Colors.white,

                                        isExpanded: true,

                                        // Initial Value
                                        hint: Text(
                                          '',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Down Arrow Icon
                                        icon: Icon(Icons.keyboard_arrow_down),

                                        items:
                                            filterTypeList.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // Array list of items
                                        // items: [
                                        //   DropdownMenuItem(
                                        //     value: '1',
                                        //     child: Text(
                                        //       'Deposit',
                                        //       style: TextStyle(),
                                        //     ),
                                        //   ),
                                        //   DropdownMenuItem(
                                        //     value: '2',
                                        //     child: Text(
                                        //       'Withdraw',
                                        //       style: TextStyle(),
                                        //     ),
                                        //   ),
                                        // ],
                                        // After selecting the desired option,it will
                                        // change button value to selected value

                                        value: dropdownValue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Filter by status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        onChanged: (newValue) {
                                          setState(() {
                                            dropdownStatus = newValue!;
                                          });
                                        },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),

                                        dropdownColor: Colors.white,

                                        isExpanded: true,

                                        // Initial Value
                                        hint: Text(
                                          '',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Down Arrow Icon
                                        icon: Icon(Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: filterStatusList
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value

                                        value: dropdownStatus,
                                      ),
                                    ),
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
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: appThemelightPink,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8.0),
                                child: Text(
                                  'Clear',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: appThemeBlue,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TYPE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    // child: ListView.builder(
                    //   itemCount: walletHistoryModel.data.length,
                    //   itemBuilder: ((context, index) {
                    //     return ListTile(
                    //       title: Text("Kk luxmi syment"),
                    //     );
                    //   }),
                    // ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Deposit ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: '25.00\€',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ]),
                        ),
                        Text('WID:6c9413a3ee046418b70059b1b34c7038'),
                        Text('Skrill Transaction ID: 444555666'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: ExpansionTile(
                            collapsedIconColor: Colors.black,
                            tilePadding: EdgeInsets.only(left: 0),
                            childrenPadding: EdgeInsets.all(0),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      color: appThemeteal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            children: [
                              Text('Details of Transaction'),
                              Divider(
                                color: Colors.grey,
                                height: 0,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    '29 Dec 2021, 16:34',
                                    textAlign: TextAlign.end,
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text('Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                    child: Text(
                                      '-25.00\€',
                                      style: TextStyle(
                                          color: appThemelightPink,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Market Fee ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: '5.00\€',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ]),
                        ),
                        Text('WID:6c9413a3ee046418b70059b1b34c7038'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            collapsedIconColor: Colors.black,
                            tilePadding: EdgeInsets.only(left: 0),
                            childrenPadding: EdgeInsets.all(0),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      color: appThemeteal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            children: [
                              Text('Details of Transaction'),
                              Divider(
                                color: Colors.grey,
                                height: 0,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    '29 Dec 2021, 16:34',
                                    textAlign: TextAlign.end,
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text('Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                    child: Text(
                                      '-25.00\€',
                                      style: TextStyle(
                                          color: appThemelightPink,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        // Divider(
                        //   color: Colors.grey,
                        //   height: 0,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Expanded(
                        //         child: Text(
                        //       'Date',
                        //       style: TextStyle(fontWeight: FontWeight.bold),
                        //     )),
                        //     Expanded(
                        //         child: Text(
                        //       '29 Dec 2021, 16:34',
                        //       textAlign: TextAlign.end,
                        //     )),
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //   ],
                        // ),
                        // Divider(),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Expanded(
                        //         child: Text('Amount',
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.bold))),
                        //     Expanded(
                        //       child: Text(
                        //         '-25.00\€',
                        //         style: TextStyle(
                        //             color: appThemelightPink,
                        //             fontWeight: FontWeight.bold),
                        //         textAlign: TextAlign.end,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //   ],
                        // ),
                        // Divider(),
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
