import 'package:flutter/material.dart';
import 'package:tipster/Controller/NewPasswordController.dart';
import 'package:tipster/utils/colors.dart';

import '../../constants/widgets/signUpAppBar.dart';

class ReEnterPassword extends StatefulWidget {
  String? email;
  ReEnterPassword({Key? key, @required this.email}) : super(key: key);

  @override
  State<ReEnterPassword> createState() => _ReEnterPasswordState();
}

class _ReEnterPasswordState extends State<ReEnterPassword> {
  final NewPasswordController _controller = NewPasswordController();

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
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter new password:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          child: TextField(
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
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm new password:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          child: TextField(
                            controller: _controller.newPassword,
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
                      print(widget.email.toString());
                      _controller.password(widget.email.toString(), context);
                    },
                    child: Text('SEND'),
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
