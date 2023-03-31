import 'package:flutter/material.dart';
import 'package:tipster/Controller/VerifyOtpController.dart';
import 'package:tipster/View/forgot_password_flow/re-enter_password.dart';
import 'package:tipster/utils/colors.dart';

import '../../constants/widgets/signUpAppBar.dart';

class RecoveryCode extends StatefulWidget {
  String? text;

  RecoveryCode({Key? key, @required this.text}) : super(key: key);

  @override
  State<RecoveryCode> createState() => _RecoveryCodeState();
}

class _RecoveryCodeState extends State<RecoveryCode> {
  final VerifyOtpController _controller = VerifyOtpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonSignUpAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appThemeBlue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Center(
                  child: Text(
                    'FORGOT PASSWORD',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'A recovery code wast sent to your email',
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter recovery code:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          child: TextField(
                            controller: _controller.otp,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: appThemeBlue, width: 1.0),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print(widget.text.toString());
                      _controller.verifyOtp(widget.text.toString(), context);

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ReEnterPassword()));
                    },
                    child: Text('Confirm'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(appThemeBlue)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
