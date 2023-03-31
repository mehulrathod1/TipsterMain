import 'package:flutter/material.dart';
import 'package:tipster/View/home_screen.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/commonBtn.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/utils/colors.dart';

class MyCouponSavedScreen extends StatefulWidget {
  MyCouponSavedScreen({Key? key}) : super(key: key);

  @override
  State<MyCouponSavedScreen> createState() => _MyCouponSavedScreenState();
}

class _MyCouponSavedScreenState extends State<MyCouponSavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 32.0, bottom: 16.0),
                        child: Container(
                          color: appThemeBlue,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'data',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CommonBottomWidget()
        ],
      ),
    );
  }
}
