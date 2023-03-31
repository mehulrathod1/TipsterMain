import 'package:flutter/material.dart';
import 'package:tipster/View/SELLER%20ADMIN/seller_admin_subscribers.dart';
import 'package:tipster/View/publish_new_pick.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/constants/widgets/seller_admin_popup_widget.dart';
import 'package:tipster/utils/colors.dart';

class SellerAdminFeesEarnings extends StatefulWidget {
  SellerAdminFeesEarnings({Key? key}) : super(key: key);

  @override
  State<SellerAdminFeesEarnings> createState() =>
      _SellerAdminFeesEarningsState();
}

class _SellerAdminFeesEarningsState extends State<SellerAdminFeesEarnings> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                                    'FEES & EARNINGS',
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Acceptance of terms',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'By enrolling as Seller in the Webname Market, you certify that you are 18 years of age or older and that you have read and accept the the following Fees and Earnings Terms. '
                          'Webname reserves the right, at its sole discretion, to alter these terms at any time'
                          '. It is your responsibility to check them periodically for any changes. '
                          'Your continued use of Webname Market following such revisions will constitut'
                          'e your acceptance of the changed Fees and Earnings Terms. If you do not agree'
                          ' with the revised terms, do not continue to use Webname Market.',
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Earnings, market fee and other costs',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1.  '),
                            Expanded(
                              child: Text(
                                'Sellers are charged a 4.5% payment processing fee for each Buyer subscription. It is shown as "Taxes" in the Monthly Statement in your Seller Admin. This fee is to cover the charges paid by Blogabet to different payment processors for clients’ deposits.',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2.  '),
                            Expanded(
                              child: Text(
                                  'Sellers are charged a sliding Blogabet Market fee, based on the volume of the NET revenue* from subscriptions per calendar month. The higher the volume, the lower fee you will be charged.',
                                  textAlign: TextAlign.justify),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3.  '),
                            Expanded(
                              child: Text(
                                  'A minimum monthly Market fee of 10 EUR is due for every calendar month when a Seller has been active and published one or more paid picks. If the Seller did not have sales and earnings during the month, the 10 EUR fee will be deducted automatically from his Blogabet wallet at the start of the next month. In case the Seller\'s wallet balance becomes negative, his Market account will be temporary suspended pending payment of the due balance.',
                                  textAlign: TextAlign.justify),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('4.  '),
                            Expanded(
                              child: Text(
                                  'An additional administrative fee of 5 EUR will be deducted from Sellers earnings for processing each Buyer refund.'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('5.  '),
                            Expanded(
                              child: Text(
                                  'In case of a Buyer account being terminated due to violation of the Rules for Buyers (i.e. re-sale of picks, bot usage, credit card fraud etc) any active of that account subscription will be cancelled and the funds removed from the Sellers Earnings regardless of days remaining and/or profit provided to that subscription.'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Payment schedule'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1.  '),
                            Expanded(
                              child: Text(
                                  'Seller\'s earnings for a calendar month will appear as DUE only when all 30-day subscriptions from that month have either expired, are pending refund or have become active non-refundable. Active non-refundable subscriptions are those subscriptions that have received a free 30-day extension and the customer has not requested a refund within the 72-hour deadline.'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2.  '),
                            Expanded(
                              child: Text(
                                'To estimate when payout will be scheduled, visit the Earnings Tab of the Seller Admin. Hovering over the (?) icon next to the On Hold status in the monthly statement, the expected DUE date will be displayed.',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3.  '),
                            Expanded(
                              child: Text(
                                'Earnings will be credited to the Seller\'s Wallet within 1-2 working days after the monthly status turns to DUE.',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('4.  '),
                            Expanded(
                              child: Text(
                                'The amount due for payment is calculated as the total revenue received from subscriptions minus the market fee, payment processing taxes, refunds and refund fees if any.',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
