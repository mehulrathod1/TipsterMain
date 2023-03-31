import 'package:flutter/material.dart';
import 'package:tipster/constants/widgets/TipsWidgets/Combo/combo_pick.dart';
import 'package:tipster/constants/widgets/TipsWidgets/Paid/paid_pick.dart';
import 'package:tipster/constants/widgets/TipsWidgets/Public/public_pick.dart';
import 'package:tipster/constants/widgets/TipsWidgets/tips_widgets.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/commonWidgets.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/utils/colors.dart';

class TipsLoggedInScreen extends StatefulWidget {
  TipsLoggedInScreen({Key? key}) : super(key: key);

  @override
  State<TipsLoggedInScreen> createState() => _TipsLoggedInScreenState();
}

class _TipsLoggedInScreenState extends State<TipsLoggedInScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: TabBar(
              tabs: [Tab(child: Text('ALL')), Tab(child: Text('MY TIPSTERS'))],
              controller: _controller,
              labelColor: appThemelightPink,
              indicatorColor: appThemelightPink,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 40,
              color: appThemeBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SPORTS BETTING TIPS FEED',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                AllTipsScreen(),
                MyTipsScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyTipsScreen extends StatelessWidget {
  MyTipsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return (index + 1 == 10)
              ? CommonBottomWidget()
              : Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                  child: PublicPickWidget(
                    isFollowing: true,
                  ),
                );
        });
  }
}

class AllTipsScreen extends StatelessWidget {
  AllTipsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return (index + 1 == 20)
              ? CommonBottomWidget()
              : Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                  child: (index % 3 == 0)
                      ? PublicPickWidget(
                          isFollowing: false,
                        )
                      :
                      // (index % 5 == 0)
                      //         ? ComboPick(
                      //             isFollowing: false,
                      //           )
                      //         :
                      PaidPickWidget(
                          isFollowing: false,
                        ),
                );
        });
  }
}
