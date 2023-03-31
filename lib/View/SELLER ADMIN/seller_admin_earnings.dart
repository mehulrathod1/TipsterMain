import 'package:flutter/material.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_subscribers.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/seller_admin_popup_widget.dart';
import 'package:tipster/utils/colors.dart';

class SellerAdminEarnings extends StatefulWidget {
  SellerAdminEarnings({Key? key}) : super(key: key);

  @override
  State<SellerAdminEarnings> createState() => _SellerAdminEarningsState();
}

class _SellerAdminEarningsState extends State<SellerAdminEarnings> {
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
                                    'EARNINGS',
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
                            Text(
                              'Overview',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
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
                                            padding:
                                                EdgeInsets.only(left: 18.0),
                                            child: Text('1'),
                                          ),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: '2',
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 18.0),
                                            child: Text('2'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'All-time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Payments received'),
                            Text('0'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Payments due'),
                            Text('0'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('On hold'),
                            Text('0'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Earnings'),
                            Text('0'),
                          ],
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
