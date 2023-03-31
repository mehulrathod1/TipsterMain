import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipster/View/BUYER%20ADMIN/buyer_admin_susbscription.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_settings.dart';
import 'package:tipster/View/TIPS/tips_logged_screen.dart';
import 'package:tipster/View/WALLET/wallet_deposit_screen.dart';
import 'package:tipster/View/blog_view.dart';
import 'package:tipster/View/home_screen.dart';
import 'package:tipster/View/home_screen_logged_id.dart';
import 'package:tipster/View/publish_new_pick.dart';
import 'package:tipster/View/settings_screen.dart';
import 'package:tipster/View/signup_screen.dart';
import 'package:tipster/utils/colors.dart';

import '../../utils/Globles.dart';

class commonAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _commonAppBarState createState() => _commonAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}

class _commonAppBarState extends State<commonAppBar> {
  Future<void> navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print(Globles.userId);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return getAppBar(context);
  }

  final listOfMoreMenu = [
    "BLOG",
    "NEWPICK+",
    "TIPS",
    "MY TIPSTERS",
    "BALANCE",
    "SETTINGS",
    "SELLER ADMIN ",
    "BUYER ADMIN",
    "LOGOUT"
  ];
  final listOfMoreMenu2 = [
    "NEWPICK+",
    "TIPS",
    "TIPSTERS",
  ];

  void _showPopupMenu(BuildContext context) async {
    List<PopupMenuEntry<Object>> list = [];
    for (var element in listOfMoreMenu) {
      list.add(PopupMenuItem(
          value: element,
          padding: EdgeInsets.zero,
          enabled: true,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _selectMoreOption(listOfMoreMenu.indexOf(element), context);
                },
                child: Container(
                  height: 50,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      element.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              (listOfMoreMenu.indexOf(element) + 1 == listOfMoreMenu.length)
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Colors.white,
                        height: 0,
                      ),
                    ),
            ],
          )));
      // list.add(PopupMenuDivider());
    }
    var sizeOfScreen = MediaQuery.of(context).size;
    await showMenu(
        context: context,
        color: appThemeBlue,
        position: RelativeRect.fromLTRB(sizeOfScreen.width, 50, 0, 0),
        items: list,
        useRootNavigator: true);
  }

  void _showPopupMenu2(BuildContext context) async {
    List<PopupMenuEntry<Object>> list = [];
    for (var element in listOfMoreMenu2) {
      list.add(PopupMenuItem(
          value: element,
          padding: EdgeInsets.zero,
          enabled: true,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _selectMoreOption2(listOfMoreMenu2.indexOf(element), context);
                },
                child: Container(
                  height: 50,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      element.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              (listOfMoreMenu2.indexOf(element) + 1 == listOfMoreMenu2.length)
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Colors.white,
                        height: 0,
                      ),
                    ),
            ],
          )));
      // list.add(PopupMenuDivider());
    }
    var sizeOfScreen = MediaQuery.of(context).size;
    await showMenu(
        color: appThemeBlue,
        context: context,
        position: RelativeRect.fromLTRB(
            sizeOfScreen.width, 100, MediaQuery.of(context).size.width / 2, 0),
        items: list,
        useRootNavigator: true);
  }

  void _selectMoreOption(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogView(
                      isLoggedin: true,
                      isUser: true,
                    )));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PublishNewPickScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TipsLoggedInScreen()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreenLogIn()));
        break;
      case 4:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WalletDepositScreen()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
      case 6:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SellerAdminSettings()));
        break;
      case 7:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BuyerAdminSubscriptions()));
        break;
      case 8:
        navigate();
        break;
    }
  }

  void _selectMoreOption2(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PublishNewPickScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TipsLoggedInScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreenLogIn()));
        break;
    }
  }

  Widget getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appThemeBlue,
      leadingWidth: 66,
      leading: GestureDetector(
        child: Container(
          height: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10),
            child: Icon(
              Icons.menu,
              size: 40,
            ),
          ),
        ),
        onTap: () {
          _showPopupMenu2(context);
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            _showPopupMenu(context);
          },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_picture.png'),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
