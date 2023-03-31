import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tipster/Controller/TipCategoryController.dart';
import 'package:tipster/Models/GetSportsModel.dart';
import 'package:tipster/Models/TipCategoryModel.dart';
import 'package:tipster/View/home_screen.dart';
import 'package:tipster/View/my_coupon_screen.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/commonBtn.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/utils/colors.dart';
import '../Controller/BetController.dart';
import '../Controller/BetsController.dart';
import '../Controller/CompetitionController.dart';
import '../Controller/MarketController.dart';
import '../Controller/SportController.dart';
import '../Controller/SportsController.dart';
import '../Controller/bookmarkController.dart';
import '../Models/BookmarkModel.dart';
import '../Models/CompetitionsModel.dart';
import '../Models/CouponModel.dart';
import '../Models/GetBetModel.dart';
import '../Models/MarketModel.dart';
import '../Models/SportsModel.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../Network/ApiConstant.dart';

class NewPickScreen extends StatefulWidget {
  NewPickScreen({Key? key}) : super(key: key);

  @override
  State<NewPickScreen> createState() => _NewPickScreenState();
}

class _NewPickScreenState extends State<NewPickScreen> {
  TextStyle commonstyle = TextStyle(fontSize: 18);
  String? selectedItem;
  String? Add = 'Add';

  late TipCategoryModel tipCategoryModel;
  late TipCategoryData tipCategoryData;
  TipCategoryController tipCategoryController = TipCategoryController();
  List<TipCategoryData> tipCategoryList = [];
  TipCategoryData? _dataValue;

  late GetSportsModel getSportsModel;
  late GetSportData getSportData;
  SportsController sportsController = SportsController();
  List<GetSportData> sportsList = [];
  List<GetSportData> sportsList2 = [];
  GetSportData? _selectedValue;

  late GetBetModel getBetModel;
  late GetBets getBets;
  BetController betController = BetController();
  List<GetBets> betssList = [];
  GetBets? selectedValue;

  late BookmarkModel bookmarkModel;
  BookmarkController bookmarkController = BookmarkController();
  List<BookmarkModel> bookmarkList = [];
  BookmarkModel? val;

  late SportsModel sportsModel;
  SportController sportController = SportController();

  late CompetitionsModel competitionsModel;
  CompetitionController competitionController = CompetitionController();

  late MarketModel marketModel;
  MarketController marketController = MarketController();
  late B b;

  BetsController betsController = BetsController();

  final url = "https://odds.prod.betnclubs.com/bookmakers";
  List<String> postData = [];
  List<String> sportsDataList = [];
  List<String> competitionDataList = [];
  List<String> marketDataList = [];
  List<String> betsDataList = [];
  List<String> eventDataList = [];
  List<CouponModel> dDataList = [];

  List<int> bookmarkIdList = [];
  List<int> sportsIdList = [];
  List<int> competitionIdList = [];
  List<int> marketIdList = [];
  List<int> betsIdList = [];
  List<int> eventIdList = [];

  late CouponModel couponModel;
  late List<CouponModel> addToCouponList = [];

  String dropdownValue = "";
  String sportDropdownValue = "";
  String competitionDropdownValue = "";
  String marketDropdownValue = "";
  String betsDropdownValue = "";
  String eventDropdownValue = "";

  String bookmarkId = "4";
  String sportsId = "48242";
  String competitionId = "4";
  String eventId = "4";
  String marketId = "4";
  String betId = "4";

  Future initialize(BuildContext context) async {
    bookmarkController.getBookmark(context).then((value) {
      setState(() {
        // bookmarkList = postData.cast<BookmarkModel>();
        for (var i = 0; i < value.length; i++) {
          //postData = value;
          final pos = value[i];
          postData.add(pos["name"]);
          bookmarkIdList.add(pos["id"]);
          // print("name:${pos["name"]} \n id:${pos["id"]} ");
        }
      });
      dropdownValue = postData.first;
    });

    bookmarkController.getSportData(context, bookmarkId).then((value) {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          //postData = value;
          final pos = value[i];
          sportsDataList.add(pos["name"]);
          sportsIdList.add(pos["id"]);
          // print("name:${pos["name"]} \n id:${pos["id"]} ");
        }
      });

      sportDropdownValue = sportsDataList.first;
    });

    bookmarkController
        .getCompetitionData(context, bookmarkId, sportsId)
        .then((value) {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          final pos = value[i];
          competitionDataList.add(pos["name"]);
        }

        competitionDropdownValue = competitionDataList.first;
      });
    });

    bookmarkController.getEventData(context).then((value) {
      setState(() {
        print(value![0]["FID"]);

        eventId = value![0]["FID"].toString();
        for (var i = 0; i < value!.length; i++) {
          // final pos = value[i];
          // eventDataList.add(pos["PART"].toString());

          for (var j = 0; j < value[i]["PART"].length; j++) {
            final p = value[i]["PART"][j]["N"];
            eventDataList.add(p);
          }
        }

        eventDropdownValue = eventDataList.first;

        bookmarkController.getMarketData(context, eventId).then((value) {
          setState(() {
            marketId = value[0]["ID"].toString();

            for (var i = 0; i < value.length; i++) {
              final pos = value[i];
              marketDataList.add(pos["N"]);
            }
            marketDropdownValue = marketDataList.first;

            bookmarkController
                .getBetsData(context, eventId, marketId)
                .then((value) {
              setState(() {
                print(marketId);
                for (var i = 0; i < value!.length; i++) {
                  final pos = value[i];
                  betsDataList.add(pos["N"]);
                }
                betsDropdownValue = betsDataList.first;
              });
            });
          });
        });
      });
    });

    sportsController.getSports(context).then((value) {
      setState(() {
        getSportsModel = value;
        sportsList = value.data;
      });
    });

    betController.getBets(context).then((value) {
      setState(() {
        getBetModel = value;
        betssList = value.data;
      });
    });

    tipCategoryController.getCategory(context).then((value) {
      setState(() {
        tipCategoryModel = value;
        tipCategoryList = value.data;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // getProfileController.getProfile().then((value)
    // {
    //   setState(() {

    initialize(context);
    // fetchPost();
    // getProfileModel = value;
    //
    // print(value.data[0].firstName);
    // txt = value.data[0].firstName;
    // });
    // });

    super.initState();
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
                            'NEW PICK',
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'BookMarker',
                              style: commonstyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  isExpanded: true,
                                  // value: dropdownValue,
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 18.0),
                                    child: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                  ),
                                  // iconSize: 24,
                                  underline: Container(),
                                  items: postData.map<DropdownMenuItem<String>>(
                                      (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(items),
                                      ),
                                    );
                                  }).toList(),

                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;

                                      bookmarkId = bookmarkIdList[
                                              postData.indexOf(dropdownValue)]
                                          .toString();

                                      // print(ApiConstant.sports);
                                      print("object $bookmarkId");
                                      sportsDataList.clear();
                                      bookmarkController
                                          .getSportData(context, bookmarkId)
                                          .then((value) {
                                        setState(() {
                                          for (var i = 0;
                                              i < value.length;
                                              i++) {
                                            //postData = value;
                                            final pos = value[i];
                                            sportsDataList.add(pos["name"]);
                                            // print("name:${pos["name"]} \n id:${pos["id"]} ");

                                          }
                                        });
                                        sportDropdownValue =
                                            sportsDataList.first;
                                      });
                                    });
                                  },
                                )),

                            // child: Container(
                            //     height: 40,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //         color: Colors.grey,
                            //       ),
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //     width: double.infinity,
                            //     child: DropdownButtonHideUnderline(
                            //       child: DropdownButton<TipCategoryData>(
                            //         value: _dataValue,
                            //         isExpanded: true,
                            //         hint: Padding(
                            //           padding: EdgeInsets.all(8.0),
                            //           child: Text('Bet365', style: commonstyle),
                            //         ),
                            //
                            //         // value: dropdownValue,
                            //         icon: Padding(
                            //           padding: EdgeInsets.only(right: 18.0),
                            //           child: Icon(
                            //               Icons.keyboard_arrow_down_outlined),
                            //         ),
                            //         // iconSize: 24,
                            //         //underline: Container(),
                            //         items: tipCategoryList
                            //             .map<DropdownMenuItem<TipCategoryData>>(
                            //                 (TipCategoryData items) {
                            //           return DropdownMenuItem(
                            //             value: items,
                            //             child: Padding(
                            //               padding: const EdgeInsets.all(8.0),
                            //               child: Text(items.name),
                            //             ),
                            //           );
                            //         }).toList(),
                            //
                            //         onChanged: (newValue) {
                            //           setState(() {
                            //             _dataValue = newValue!;
                            //           });
                            //         },
                            //       ),
                            //     )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Sport',
                              style: commonstyle,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    value: sportDropdownValue,
                                    isExpanded: true,
                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),
                                    // iconSize: 24,
                                    underline: Container(),
                                    items: sportsDataList
                                        .map<DropdownMenuItem<String>>(
                                            (String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        sportDropdownValue = newValue!;

                                        sportsId = sportsIdList[sportsDataList
                                                .indexOf(sportDropdownValue)]
                                            .toString();

                                        // print(ApiConstant.sports);
                                        print("object $sportsId");
                                      });
                                    },
                                  ))
                              // Container(
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     width: double.infinity,
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton<GetSportData>(
                              //         isExpanded: true,
                              //         value: _selectedValue,
                              //         hint: Padding(
                              //           padding: EdgeInsets.all(8.0),
                              //           child: Text("American Football",
                              //               style: commonstyle),
                              //         ),
                              //
                              //         // value: dropdownValue,
                              //         icon: Padding(
                              //           padding: EdgeInsets.only(right: 18.0),
                              //           child: Icon(
                              //               Icons.keyboard_arrow_down_outlined),
                              //         ),
                              //
                              //         items: sportsList
                              //             .map<DropdownMenuItem<GetSportData>>(
                              //                 (GetSportData items) {
                              //           return DropdownMenuItem(
                              //             value: items,
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Text(items.name),
                              //             ),
                              //           );
                              //         }).toList(),
                              //
                              //         onChanged: (newValue) {
                              //           setState(() {
                              //             _selectedValue = newValue!;
                              //           });
                              //         },
                              //       ),
                              //     )),
                              ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Competition', style: commonstyle),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    value: competitionDropdownValue,
                                    isExpanded: true,
                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),
                                    // iconSize: 24,
                                    underline: Container(),
                                    items: competitionDataList
                                        .map<DropdownMenuItem<String>>(
                                            (String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        competitionDropdownValue = newValue!;
                                      });
                                    },
                                  ))
                              // Container(
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     width: double.infinity,
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton<GetSportData>(
                              //         isExpanded: true,
                              //         value: _selectedValue,
                              //         hint: Padding(
                              //           padding: EdgeInsets.all(8.0),
                              //           child: Text("NBA", style: commonstyle),
                              //         ),
                              //
                              //         // value: dropdownValue,
                              //         icon: Padding(
                              //           padding: EdgeInsets.only(right: 18.0),
                              //           child: Icon(
                              //               Icons.keyboard_arrow_down_outlined),
                              //         ),
                              //
                              //         items: sportsList2
                              //             .map<DropdownMenuItem<GetSportData>>(
                              //                 (GetSportData items) {
                              //           return DropdownMenuItem(
                              //             value: items,
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Text(items.name),
                              //             ),
                              //           );
                              //         }).toList(),
                              //
                              //         onChanged: (newValue) {
                              //           setState(() {
                              //             _selectedValue = newValue!;
                              //           });
                              //         },
                              //       ),
                              //     )),
                              ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Event', style: commonstyle),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    value: eventDropdownValue,
                                    isExpanded: true,
                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),
                                    // iconSize: 24,
                                    underline: Container(),
                                    items: eventDataList
                                        .map<DropdownMenuItem<String>>(
                                            (String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        eventDropdownValue = newValue!;
                                      });
                                    },
                                  ))
                              // Container(
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     width: double.infinity,
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton<GetSportData>(
                              //         isExpanded: true,
                              //         value: _selectedValue,
                              //         hint: Padding(
                              //           padding: EdgeInsets.all(8.0),
                              //           child: Text("Rakuten Monkeys",
                              //               style: commonstyle),
                              //         ),
                              //
                              //         // value: dropdownValue,
                              //         icon: Padding(
                              //           padding: EdgeInsets.only(right: 18.0),
                              //           child: Icon(
                              //               Icons.keyboard_arrow_down_outlined),
                              //         ),
                              //
                              //         items: sportsList2
                              //             .map<DropdownMenuItem<GetSportData>>(
                              //                 (GetSportData items) {
                              //           return DropdownMenuItem(
                              //             value: items,
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Text(items.name),
                              //             ),
                              //           );
                              //         }).toList(),
                              //
                              //         onChanged: (newValue) {
                              //           setState(() {
                              //             _selectedValue = newValue!;
                              //           });
                              //         },
                              //       ),
                              //     )),
                              ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Market', style: commonstyle),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    value: marketDropdownValue,
                                    isExpanded: true,
                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),
                                    // iconSize: 24,
                                    underline: Container(),
                                    items: marketDataList
                                        .map<DropdownMenuItem<String>>(
                                            (String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        marketDropdownValue = newValue!;
                                      });
                                    },
                                  ))

                              // Container(
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     width: double.infinity,
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton<GetSportData>(
                              //         isExpanded: true,
                              //         value: _selectedValue,
                              //         hint: Padding(
                              //           padding: EdgeInsets.all(8.0),
                              //           child: Text(
                              //               "Under/Over Including Overtime",
                              //               style: commonstyle),
                              //         ),
                              //
                              //         // value: dropdownValue,
                              //         icon: Padding(
                              //           padding: EdgeInsets.only(right: 18.0),
                              //           child: Icon(
                              //               Icons.keyboard_arrow_down_outlined),
                              //         ),
                              //
                              //         items: sportsList2
                              //             .map<DropdownMenuItem<GetSportData>>(
                              //                 (GetSportData items) {
                              //           return DropdownMenuItem(
                              //             value: items,
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Text(items.name),
                              //             ),
                              //           );
                              //         }).toList(),
                              //
                              //         onChanged: (newValue) {
                              //           setState(() {
                              //             _selectedValue = newValue!;
                              //           });
                              //         },
                              //       ),
                              //     )),

                              ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Bet', style: commonstyle),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    value: betsDropdownValue,
                                    isExpanded: true,
                                    // value: dropdownValue,
                                    icon: Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                    ),
                                    // iconSize: 24,
                                    underline: Container(),
                                    items: betsDataList
                                        .map<DropdownMenuItem<String>>(
                                            (String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(items),
                                        ),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        betsDropdownValue = newValue!;
                                      });
                                    },
                                  ))
                              // Container(
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     width: double.infinity,
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton<GetBets>(
                              //         isExpanded: true,
                              //         value: selectedValue,
                              //         hint: Padding(
                              //           padding: EdgeInsets.all(8.0),
                              //           child: Text(
                              //               'Under/Over Including Overtime',
                              //               style: commonstyle),
                              //         ),
                              //
                              //         // value: dropdownValue,
                              //         icon: Padding(
                              //           padding: EdgeInsets.only(right: 18.0),
                              //           child: Icon(
                              //               Icons.keyboard_arrow_down_outlined),
                              //         ),
                              //
                              //         // iconSize: 24,
                              //
                              //         //underline: Container(),
                              //         items: betssList
                              //             .map<DropdownMenuItem<GetBets>>(
                              //                 (GetBets items) {
                              //           return DropdownMenuItem(
                              //             value: items,
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Text(items.name),
                              //             ),
                              //           );
                              //         }).toList(),
                              //
                              //         onChanged: (newValue) {
                              //           setState(() {
                              //             selectedValue = newValue!;
                              //           });
                              //         },
                              //       ),
                              //     )),
                              ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: ElevatedButton(
                                onPressed: () {
                                  // dropdownValue = postData.first;
                                  addToCouponList.add(CouponModel(
                                      a: dropdownValue,
                                      b: sportDropdownValue,
                                      c: competitionDropdownValue,
                                      d: eventDropdownValue,
                                      e: marketDropdownValue,
                                      f: betsDropdownValue));

                                  print(addToCouponList.length);
                                  setState(() {
                                    Add = 'Add More';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Add!,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appThemelightPink)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          // combo pik = 171
                          // graded_pick = 173
                          // public_pik = 540,670
                          Center(
                            child: commonBtn(
                                context,
                                MyCouponScreen(
                                    couponModelList: addToCouponList),
                                appThemelightPink,
                                Colors.white,
                                'ADD TO COUPON',
                                18,
                                5),
                          )
                        ],
                      ))
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
