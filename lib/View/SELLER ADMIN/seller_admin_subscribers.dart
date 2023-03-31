import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipster/View/BUYER%20ADMIN/buyer_admin_transactions.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_fees.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/seller_admin_popup_widget.dart';
import 'package:tipster/utils/colors.dart';

class SellerAdminSubscribers extends StatefulWidget {
  SellerAdminSubscribers({Key? key}) : super(key: key);

  @override
  State<SellerAdminSubscribers> createState() => _SellerAdminSubscribersState();
}

class _SellerAdminSubscribersState extends State<SellerAdminSubscribers> {
  late TextStyle subscriptionStyle;

  @override
  Widget build(BuildContext context) {
    subscriptionStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
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
                            'SELLER ADMIN',
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
                            sellerAdminDialog(context);
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
                                    'SUBSCRIBERS',
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
                              'Filter by period',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,

                                    value: null,
                                    hint: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Last 6 months'),
                                    ),

                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),

                                    // iconSize: 24,

                                    //underline: Container(),
                                    onChanged: (String? newValue) {},
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: '1',
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 18.0),
                                          child: Text('1'),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: '2',
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 18.0),
                                          child: Text('2'),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Filter by status',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,

                                    value: null,
                                    hint: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Active'),
                                    ),

                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),

                                    // iconSize: 24,

                                    //underline: Container(),
                                    onChanged: (String? newValue) {},
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: '1',
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 18.0),
                                          child: Text('1'),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: '2',
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 18.0),
                                          child: Text('2'),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Filter by payment status',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,

                                value: null,
                                hint: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Paid'),
                                ),

                                // value: dropdownValue,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                ),

                                // iconSize: 24,

                                //underline: Container(),
                                onChanged: (String? newValue) {},
                                items: [
                                  DropdownMenuItem<String>(
                                    value: '1',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('1'),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '2',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('2'),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Filter by subscription',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,

                                value: null,
                                hint: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('30 Days'),
                                ),

                                // value: dropdownValue,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                ),

                                // iconSize: 24,

                                //underline: Container(),
                                onChanged: (String? newValue) {},
                                items: [
                                  DropdownMenuItem<String>(
                                    value: '1',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('1'),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '2',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('2'),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Order by',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,

                                value: null,
                                hint: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Plan start'),
                                ),

                                // value: dropdownValue,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                ),

                                // iconSize: 24,

                                //underline: Container(),
                                onChanged: (String? newValue) {},
                                items: [
                                  DropdownMenuItem<String>(
                                    value: '1',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('1'),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '2',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('2'),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
                  child: Material(
                    elevation: 2.0,
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Color(0xff3C78B5),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'WinnerOU',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'winnerou.webname.com',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Flag.fromCode(FlagsCode.RO,
                                  height: 10, width: 20, fit: BoxFit.fill),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                    '75\€/MONTH',
                                    style: subscriptionStyle,
                                  ))),
                                  Expanded(
                                      child: Center(
                                          child: Text('12.01.2022',
                                              style: subscriptionStyle))),
                                  Expanded(
                                      child: Center(
                                          child: Text('11.02.2022',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              )))),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: Text('Price',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              )))),
                                  Expanded(
                                      child: Center(
                                          child: Text('Start date',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              )))),
                                  Expanded(
                                      child: Center(
                                          child: Text('End date',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              )))),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          CommonBottomWidget()
        ],
      ),
    );
  }
}
