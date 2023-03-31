import 'package:flutter/material.dart';
import 'package:tipster/View/settings_screen.dart';
import 'package:tipster/utils/colors.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: appThemeBlue,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SPORTS BETTING TIPS FEED',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()));
                      },
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          openPickWidget(),
          paidPickWidget(),
        ],
      ),
    );
  }
}

class openPickWidget extends StatelessWidget {
  openPickWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('OnlyElite'),
                          Text('11 Feb 2022 11:20'),
                          Text('+14% (253)'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.person_add_alt),
                            Text('FOLLOW')
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: appThemeBlue),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                            color: appThemeBlue,
                            borderRadius: BorderRadius.circular(8)),
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
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sassuola v Roma',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Over 1.5 (Match Goals) @ 1.667'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: appThemelightBlue,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            child: Text(
                              '10/10',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: appThemeteal,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            child: Text(
                              'bet365',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Football / Livebet / Kick off: 13 Feb 2022, 19:00',
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )),
            Divider(),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_off_alt,
                                    size: 18,
                                  ),
                                  Text('Like')
                                ],
                              ),
                            )),
                        Row(
                          children: [
                            Text('Likes (15)'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Comments (0)'),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        color: Colors.grey.withOpacity(0.3),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                filled: true,
                                hintText: 'Write a comment',
                                hintStyle: TextStyle(fontSize: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 1.0),
                                    borderRadius: BorderRadius.circular(7)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 1.0),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            )),
                            Container(
                              decoration: BoxDecoration(
                                  color: appThemelightPink,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  'Comment',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class paidPickWidget extends StatelessWidget {
  paidPickWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('OnlyElite'),
                          Text('11 Feb 2022 11:20'),
                          Text('+14% (253)'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.person_add_alt),
                            Text('FOLLOW')
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: appThemeBlue),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                            color: appThemeBlue,
                            borderRadius: BorderRadius.circular(8)),
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
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    Wrap(
                      children: [
                        Text('You can see the pick only after'),
                        Text(
                          ' subscribing',
                          style: TextStyle(color: appThemelightPink),
                        ),
                        Text(
                          'or buying it for 5.00\$',
                          style: TextStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                )),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    color: appThemelightPink,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
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
      ),
    );
  }
}
