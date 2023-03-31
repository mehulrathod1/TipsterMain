import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipster/View/BUYER%20ADMIN/buyer_admin_susbscription.dart';
import 'package:tipster/View/login_screen.dart';
import 'package:tipster/utils/colors.dart';

class PaidPickWidgetBlog extends StatelessWidget {
  final bool isFollowing;
  final bool isUser;
  final bool isLoggedIn;
  const PaidPickWidgetBlog({
    Key? key,
    required this.isFollowing,
    required this.isUser,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OnlyElite',
                            style: TextStyle(
                                color: appThemelightPink,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '11 Feb 2022 11:20',
                            style: TextStyle(color: Color(0xffB5B5B5)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 25,
                      child: (isLoggedIn)
                          ? (isFollowing)
                              ? Center(child: Text('FOLLOWING'))
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.person_add_alt),
                                    Text('FOLLOW')
                                  ],
                                )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.person_add_alt),
                                  Text('FOLLOW')
                                ],
                              ),
                            ),
                      decoration: BoxDecoration(
                          border: Border.all(color: appThemeBlue),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isLoggedIn) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BuyerAdminSubscriptions()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 25,
                        decoration: BoxDecoration(
                            color: appThemeBlue,
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              '55\€/MONTH',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Divider(
              height: 0,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock),
                      Text(
                        'Paid pick',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'You can see the pick only after ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                                text: 'subscribing ',
                                style: TextStyle(color: Colors.red)),
                            TextSpan(
                                text: 'or buying it for 5.00 € ',
                                style: TextStyle(color: Colors.black))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Divider(
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: appThemelightPink,
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    Text(
                      'Buy for 5.00 \$',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
