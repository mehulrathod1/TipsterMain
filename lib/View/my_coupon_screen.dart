import 'package:flutter/material.dart';
import 'package:tipster/View/my_coupon_saved_screen.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/commonBtn.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/utils/colors.dart';

import '../Models/CouponModel.dart';

class MyCouponScreen extends StatefulWidget {
  MyCouponScreen({Key? key, required this.couponModelList}) : super(key: key);

  final List<CouponModel> couponModelList;

  // MyCouponScreen({required List<CouponModel> couponModelList})
  //     : this.couponModelList = couponModelList ?? [];
  @override
  State<MyCouponScreen> createState() => _MyCouponScreenState(couponModelList);

// NameViewList({List<String> names}) : this.names = names ?? [];
// final List<String> names;

}

class _MyCouponScreenState extends State<MyCouponScreen> {
  bool paidPick = true;
  bool freePick = false;
  List<String> dataValues = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  String dropDownValue = '1';

  final List<CouponModel> couponModelList;

  _MyCouponScreenState(this.couponModelList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: commonAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: appThemeBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'MY COUPON',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              color: appThemelightBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: couponModelList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                color: appThemeBlue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              couponModelList[index].b,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        Text(
                                          couponModelList[index].c,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          couponModelList[index].d,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          couponModelList[index].e,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          couponModelList[index].f,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'odd:',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '2.90',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Bookmark:',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              couponModelList[index].a,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'odds:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '8.70',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'stake(1-10):',
                          style: TextStyle(color: Colors.white),
                        ),

                        Container(
                          color: Colors.white,
                          height: 25,
                          width: 50,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              enableFeedback: false,
                              alignment: AlignmentDirectional.topStart,
                              underline: Container(),
                              dropdownColor: Colors.white,
                              isDense: true,
                              isExpanded: true,
                              focusColor: Colors.white,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                              ),
                              items: dataValues.map((String e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      width: 20,
                                      child: Text(
                                        e,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? v) {
                                setState(() {
                                  dropDownValue = v!;
                                });
                              },
                              value: dropDownValue,
                            ),
                          ),
                        )

                        // Container(
                        //   color: Colors.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 16.0, vertical: 2),
                        //     child: Text(
                        //       '1',
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  freePick = !freePick;
                                  paidPick = (freePick) ? false : true;
                                });
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: (paidPick)
                                        ? appThemeBlue
                                        : Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Paid Pick',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  paidPick = !paidPick;
                                  freePick = (paidPick) ? false : true;
                                });
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: (freePick)
                                        ? appThemeBlue
                                        : Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Free Pick',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("you pick has been created"),
                            duration: Duration(seconds: 1),
                          ));

                          // Navigator.pushReplacement(
                          //     context,
                          // MaterialPageRoute(
                          //     builder: (context) => MyCouponSavedScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'CREATE PICK',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(appThemelightPink)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Analysis:',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                      ),
                    ),
                  ),
                  Center(
                    child: commonBtn(context, MyCouponSavedScreen(),
                        appThemelightPink, Colors.white, 'CREATE PICK', 18, 5),
                    // child: Container(
                    //   decoration:
                    //       BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //         content: Text("you pick has been created"),
                    //         duration: Duration(seconds: 1),
                    //       ));
                    //
                    //       // Navigator.pushReplacement(
                    //       //     context,
                    //       // MaterialPageRoute(
                    //       //     builder: (context) => MyCouponSavedScreen()));
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         'CREATE PICK',
                    //         style: TextStyle(fontSize: 18, color: Colors.white),
                    //       ),
                    //     ),
                    //     style: ButtonStyle(
                    //         backgroundColor:
                    //             MaterialStateProperty.all(appThemelightPink)),
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: 10,
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
