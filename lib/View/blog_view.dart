import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tipster/View/BUYER%20ADMIN/buyer_admin_susbscription.dart';
import 'package:tipster/View/login_screen.dart';
import 'package:tipster/constants/widgets/TipsWidgetsForBlogView/Graded/graded_pick.dart';
import 'package:tipster/constants/widgets/TipsWidgetsForBlogView/Paid/paid_pick.dart';
import 'package:tipster/constants/widgets/TipsWidgetsForBlogView/Public/public_pick.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/commonWidgets.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/seller_admin_popup_widget.dart';
import 'package:tipster/utils/colors.dart';
import '../Controller/GetServiceDescriptionController.dart';
import '../Models/GetServiceDescriptionModel.dart';
import '../constants/widgets/deposit_popup.dart';
import '../constants/widgets/extera_widgets/PublicPickWidgetBlogNew.dart';

class BlogView extends StatefulWidget {
  final bool isLoggedin;
  final bool isUser;

  BlogView({Key? key, required this.isLoggedin, required this.isUser})
      : super(key: key);

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  GetServiceDescriptionController serviceDescriptionController =
      GetServiceDescriptionController();
  late GetServiceDescriptionModel serviceDescriptionModel;

  late String desc;
  TextEditingController _textEditingController = TextEditingController();

  // Future initialize(BuildContext context) async {
  //   serviceDescriptionController.getDescription(context).then((value) {
  //     // serviceDescriptionModel = value;
  //     print(value.user.serviceDesc);
  //     desc = value.user.serviceDesc;
  //   });
  // }

  Future initialize(BuildContext context) async {
    serviceDescriptionController.getDescription(context).then((value) {
      desc = value.user.serviceDesc;
      serviceDescriptionController.desc.text = value.user.serviceDesc;
    });
  }

  @override
  void initState() {
    initialize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('loss', 33.33, appThemelightPink),
      ChartData('Profit', 66.66, appThemeteal),
    ];

    final List<ChartData> chartData1 = [
      ChartData('soccer', 33.33, appThemelightPink),
      ChartData('baseball', 66.66, appThemeteal),
    ];

    return Scaffold(
      appBar: commonAppBar(),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            color: appThemelightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: appThemeBlue,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, I\'m Lorem!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(child: commonFlag())
                  ],
                )
              ],
            ),
          ),
          Container(
              height: 50,
              width: double.infinity,
              color: appThemeBlue.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('1458\nPICKS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  Text('+273\nPROFITS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  Text('+13%\nYIELD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  Text(
                    '5425\nFOLLOWERS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          Divider(
            color: appThemeBlue,
            thickness: 3,
            indent: 0,
            height: 0,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.isLoggedin) {
                        // showPopup();
                        showDepositPopup(context);
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     content: Text(
                        //         "you will subscribe and therespective amount will be deducted from youraccount")));

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => WalletDepositScreen()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 35,
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
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.isLoggedin) {
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
                      width: 120,
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.person_add_alt),
                          Text(
                            'FOLLOW',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: appThemeBlue),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      color: appThemeBlue),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'WIN RATE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SfCircularChart(
                            palette: [Colors.red, appThemeBlue],
                            borderWidth: double.minPositive,
                            title: ChartTitle(
                                text: 'Values are in Percentage %',
                                textStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            legend: Legend(
                                isVisible: true,
                                isResponsive: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                                position: LegendPosition.bottom),
                            series: <CircularSeries>[
                              // Render pie chart
                              DoughnutSeries<ChartData, String>(
                                  dataSource: chartData,
                                  radius: '85',
                                  xValueMapper: (ChartData data, _) {
                                    return data.x;
                                  },
                                  yValueMapper: (ChartData data, _) {
                                    return data.y;
                                  },
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      showCumulativeValues: true,
                                      overflowMode: OverflowMode.shift,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                      labelAlignment:
                                          ChartDataLabelAlignment.bottom,
                                      textStyle:
                                          TextStyle(color: Colors.grey))),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      color: appThemeBlue),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'TOP SPORTS',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  color: Colors.white,
                  child: Container(
                    child: SfCircularChart(
                        palette: [
                          Color(0xff095199),
                          Color(0xff0b65bf),
                        ],
                        title: ChartTitle(
                            text: 'Values are in Percentage %',
                            textStyle:
                                TextStyle(color: Colors.grey, fontSize: 12)),
                        borderWidth: double.minPositive,
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap,
                            position: LegendPosition.bottom),
                        series: <CircularSeries>[
                          // Render pie chart
                          DoughnutSeries<ChartData, String>(
                              dataSource: chartData1,
                              radius: '85',
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  overflowMode: OverflowMode.shift,
                                  labelPosition: ChartDataLabelPosition.outside,
                                  labelAlignment:
                                      ChartDataLabelAlignment.bottom,
                                  textStyle: TextStyle(color: Colors.grey))),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      color: appThemeBlue),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'PROFIT CHART',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Container(
                        child: Center(
                            child: Container(
                                child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      plotAreaBorderColor: Colors.white,
                      plotAreaBackgroundColor: Colors.white,
                      borderColor: Colors.white,
                      backgroundColor: Colors.white,
                      palette: [appThemeBlue],
                      series: <ChartSeries<SalesData, String>>[
                        LineSeries<SalesData, String>(
                            dataSource: <SalesData>[
                              SalesData('Feb\n\'21', 0),
                              SalesData('Mar\n\'21', 0),
                              SalesData('Apr\n\'21', 0),
                              SalesData('May\n\'21', 0),
                              SalesData('Jun\n\'21', 0),
                              SalesData('Jul\n\'21', 0),
                              SalesData('Aug\n\'21', 0),
                              SalesData('Sep\n\'21', 0),
                              SalesData('Dec\n\'21', 13),
                              SalesData('Jan\n\'21', 15),
                              SalesData('Feb\n\'22', 32),
                            ],
                            markerSettings: MarkerSettings(
                                isVisible: true, color: appThemeBlue),
                            xValueMapper: (SalesData data, _) => data.year,
                            yValueMapper: (SalesData data, _) => data.sales),
                      ],
                    )))),
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: appThemeBlue),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PENDING PICKS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                PublicPickWidgetBlogNew(
                  isFollowing: false,
                  isUser: widget.isUser,
                  isLoggedIn: widget.isLoggedin,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          //   child: PaidPickWidgetBlog(
          //     isFollowing: true,
          //     isUser: widget.isUser,
          //     isLoggedIn: widget.isLoggedin,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: appThemeBlue),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'GRADED PICKS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: GradedPickBlog(
                    grade: 'Won',
                    isUser: widget.isUser,
                    isLoggedIn: widget.isLoggedin,
                    isFollowing: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: GradedPickBlog(
                    grade: 'Lost',
                    isUser: widget.isUser,
                    isLoggedIn: widget.isLoggedin,
                    isFollowing: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: GradedPickBlog(
                    grade: 'Pushed',
                    isUser: widget.isUser,
                    isLoggedIn: widget.isLoggedin,
                    isFollowing: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: PublicPickAnalysisWidgetBlog(
                    isFollowing: true,
                    isUser: widget.isUser,
                    isLoggedIn: widget.isLoggedin,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          //   child: PublicPickAnalysisWidget(
          //     isFollowing: true,
          //   ),
          // ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          //   child: PaidPickWidget(
          //     isFollowing: true,
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                    color: appThemeBlue,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                  child: Text(
                    'See Older',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      color: appThemeBlue),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SERVICE DESCRIPTION',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        (widget.isUser)
                            ? GestureDetector(
                                onTap: () {
                                  serviceDialog(context, desc);
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
                    child: TextField(
                      showCursor: false,
                      enabled: false,
                      controller: serviceDescriptionController.desc,
                    ),
                  ),
                )
              ],
            ),
          ),
          CommonBottomWidget()
        ],
      ),
    );
  }

  Future showPopup() async {
    String? gender;
    bool checkBoxValue = false;
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AlertDialog(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                contentPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.all(15),

                // To display the title it is optional
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: appThemeBlue,
                        child: Center(
                          child: Text(
                            'DEPOSIT',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, left: 8, right: 8),
                        child: Text(
                          "your balance is not enough. you need to deposit before purchasing",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Current Balance:'))),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('15€'),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Deposit Amount(EUR):'))),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(left: 4),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appThemeBlue, width: 1.0),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                )),
                          ))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: Text(
                                  'Payment method:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RadioListTile(
                                  // fillColor: MaterialStateProperty.all(
                                  //     appThemeBlue),

                                  activeColor: appThemeBlue,
                                  title: Text(
                                    "Card",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  value: "Card",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                  activeColor: appThemeBlue,
                                  title: Text("Paypal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  value: "Paypal",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                  activeColor: appThemeBlue,
                                  title: Text("Skrill",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  value: "Skrill",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: checkBoxValue,
                            fillColor: MaterialStateProperty.all(appThemeBlue),
                            onChanged: (v) {
                              setState(() {
                                checkBoxValue = v!;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                                "I aknowledge that i read and agree with the Wallwet Rulles"),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: appThemeBlue),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Deposit',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Message which will be pop up on the screen
                // Action widget which will provide the user to acknowledge the choice
              ),
            );
          });
        });
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
