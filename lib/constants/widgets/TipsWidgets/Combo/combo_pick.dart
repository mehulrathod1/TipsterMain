import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipster/constants/widgets/commonWidgets.dart';
import 'package:tipster/utils/colors.dart';

class ComboPick extends StatelessWidget {
  final bool isFollowing;

  ComboPick({
    Key? key,
    required this.isFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/profile_picture.png'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
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
                          Row(
                            children: [
                              commonFlag(),
                              SizedBox(
                                width: 3,
                              ),
                              Text('+14% (253)'),
                            ],
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
                      child: (isFollowing)
                          ? Center(child: Text('FOLLOWING'))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.person_add_alt),
                                Text('FOLLOW')
                              ],
                            ),
                      decoration: BoxDecoration(
                          border: Border.all(color: appThemeBlue),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Container(
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
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
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
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Combo Pick',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.info_rounded,
                      color: appThemelightPink,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('@2.083'),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: appThemelightBlue,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        child: Text(
                          '10/10',
                          style: TextStyle(fontSize: 12, color: Colors.white),
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Text(
                    //   '-10.00 ',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: appThemelightPink),
                    // ),
                    // Text(
                    //   ' ×',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: appThemelightPink,
                    //       fontSize: 20),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'FC Barcelona VS Real Madrid',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Text(
                    //   'WON',
                    //   style: TextStyle(
                    //       color: appThemeteal, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Over 1.5 (Match Goals) @ 1.667'),
                SizedBox(
                  height: 10,
                ),
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/footbal_icon.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Football / Livebet / Kick off: 13 Feb 2022, 19:00',
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    // Text(
                    //   'LOST',
                    //   style: TextStyle(
                    //       color: Colors.transparent,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Sassuola v Roma',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Text(
                    //   'LOST',
                    //   style: TextStyle(
                    //       color: appThemelightPink,
                    //       fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Over 1.5 (Match Goals) @ 1.667'),
                SizedBox(
                  height: 10,
                ),
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/footbal_icon.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Football / Livebet / Kick off: 13 Feb 2022, 19:00',
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up_off_alt,
                                size: 18,
                              ),
                              Text('Like')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 14),
                      child: Row(
                        children: [
                          Text('Likes (15)',
                              style: TextStyle(color: appThemelightPink)),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Text('Comments '),
                              Text('(0)'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          contentPadding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          hintText: 'Write a comment...',
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
                      Padding(
                        padding:
                            EdgeInsets.only(top: 9.0, right: 10, bottom: 9.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: appThemelightPink,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                            child: Text(
                              'Comment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
