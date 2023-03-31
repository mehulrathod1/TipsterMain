import 'package:flutter/material.dart';
import 'package:tipster/Controller/GetServiceDescriptionController.dart';
import 'package:tipster/Models/GetServiceDescriptionModel.dart';
import 'package:tipster/View/change_personal_details_screen.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/seller_admin_popup_widget.dart';
import 'package:tipster/utils/colors.dart';

import '../../constants/widgets/commonAppBar.dart';

class SellerAdminSettings extends StatefulWidget {
  SellerAdminSettings({Key? key}) : super(key: key);

  @override
  State<SellerAdminSettings> createState() => _SellerAdminSettingsState();
}

class _SellerAdminSettingsState extends State<SellerAdminSettings> {
  String ThirtyPercent = '';
  String tenPercent = '';
  TextEditingController subscriptionController = TextEditingController();

  GetServiceDescriptionController serviceDescriptionController =
      GetServiceDescriptionController();
  late GetServiceDescriptionModel serviceDescriptionModel;

  late String desc;

  Future initialize(BuildContext context) async {
    serviceDescriptionController.getDescription(context).then((value) {
      // serviceDescriptionModel = value;
      print(value.user.serviceDesc);
      desc = value.user.serviceDesc;
    });
  }

  @override
  void initState() {
    initialize(context);
    super.initState();
  }

  Future subscriptionDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
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
                      'CHANGE SUBSCRIPTION PLANS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          'Set the amounts  you wish your subscriber to pay for 30 days.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'Allowed Price Range is 25 - 1000. 7 days plan is automatically calculated.',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Price',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text('%',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text('30 days',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 35,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: TextStyle(fontSize: 15),
                                            keyboardType: TextInputType.number,
                                            controller: subscriptionController,
                                            onChanged: (v) {
                                              setState(() {
                                                tenPercent =
                                                    (double.parse(v) * 0.1)
                                                        .toString();
                                                ThirtyPercent =
                                                    (double.parse(v) * 0.3)
                                                        .toString();
                                              });
                                            },
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsets.only(left: 10),
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffC4C4C4),
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: appThemeBlue,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color: Color(0xffC4C4C4),
                                              ),
                                              color: Color(0xffE1E1E1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '\€',
                                                style: TextStyle(
                                                    color: Color(0xff494949)),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                child: Center(
                              child: Text('100% ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Expanded(
                                child: Text('7 days',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 35,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: TextStyle(fontSize: 15),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10),
                                              fillColor: Color(0xffE1E1E1),
                                              filled: true,
                                              hintText: ThirtyPercent,
                                              hintStyle: TextStyle(
                                                  color: Color(0xff494949),
                                                  fontSize: 15),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffC4C4C4),
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: appThemeBlue,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color: Color(0xffC4C4C4),
                                              ),
                                              color: Color(0xffE1E1E1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '\€',
                                                style: TextStyle(
                                                    color: Color(0xff494949)),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                child: Center(
                              child: Text('30% ',
                                  textAlign: TextAlign.end,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Expanded(
                                child: Text('Pick',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 35,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: TextStyle(fontSize: 15),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10),
                                              fillColor: Color(0xffE1E1E1),
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffC4C4C4),
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              hintText: tenPercent,
                                              hintStyle: TextStyle(
                                                  color: Color(0xff494949),
                                                  fontSize: 15),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: appThemeBlue,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color: Color(0xffC4C4C4),
                                              ),
                                              color: Color(0xffE1E1E1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '\€',
                                                style: TextStyle(
                                                    color: Color(0xff494949)),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                child: Center(
                              child: Text('10% ',
                                  textAlign: TextAlign.end,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tenPercent = '';
                                  ThirtyPercent = '';
                                  subscriptionController.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: appThemelightPink,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5.0),
                                  child: Text(
                                    'CANCEL',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  subscriptionController.clear();
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: appThemeteal,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
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
                    ),
                  ),
                ],
              ),
            );
          });
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
                                    'SETTINGS',
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
                          children: [
                            Text(
                              'SUBSCRIPTION PLANS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Set up your subscription plans and fees',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () => subscriptionDialog(),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appThemelightPink,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 8.0),
                                    child: Text(
                                      'CHANGE',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'SERVICE DESCRIPTION',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Write a short description for your paid service that will show in market directory and in you blog',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                serviceDialog(context, desc);
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appThemelightPink,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 8.0),
                                    child: Text(
                                      'CHANGE',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Personal Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Fill in your personal information',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChangePersonalDetailsScreen()));
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appThemelightPink,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 8.0),
                                    child: Text(
                                      'CHANGE',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
