import 'package:flutter/material.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_settings.dart';
import 'package:tipster/View/WALLET/wallet_deposit_screen.dart';
import 'package:tipster/constants/widgets/buyer_admin_popup_widget.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/utils/colors.dart';

class BuyerAdminTransactions extends StatefulWidget {
  BuyerAdminTransactions({Key? key}) : super(key: key);

  @override
  State<BuyerAdminTransactions> createState() => _BuyerAdminTransactionsState();
}

class _BuyerAdminTransactionsState extends State<BuyerAdminTransactions> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

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
        });
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
                            'BUYER ADMIN',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            buyerAdminDialog(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: appThemeBlue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text(
                                    'TRANSACTIONS',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Filter from',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 200,
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
                                        child:
                                            Icon(Icons.calendar_today_outlined))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Filter to',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 200,
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
                                          _selecttoDate(context);
                                        },
                                        child:
                                            Icon(Icons.calendar_today_outlined))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: appThemeBlue,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8.0),
                              child: Text(
                                'Show',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
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
                              text: 'Subscription ',
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
                              text: 'Single bet ',
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
