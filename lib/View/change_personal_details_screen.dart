import 'package:flutter/material.dart';
import 'package:tipster/Controller/CountryController.dart';
import 'package:tipster/Controller/GetProfileController.dart';
import 'package:tipster/constants/widgets/commonAppBar.dart';
import 'package:tipster/constants/widgets/common_bottom_widget.dart';
import 'package:tipster/utils/colors.dart';

import '../Models/CountryModel.dart';
import '../Models/GetProfileModel.dart';

class ChangePersonalDetailsScreen extends StatefulWidget {
  ChangePersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ChangePersonalDetailsScreen> createState() =>
      _ChangePersonalDetailsScreenState();
}

class _ChangePersonalDetailsScreenState
    extends State<ChangePersonalDetailsScreen> {
  late CountryModel countryModel;
  late CountryModelData countryModelData;
  CountryController controller = CountryController();
  List<CountryModelData> countryList = [];
  late CountryModelData _selectedValue;

  late GetProfileModel getProfileModel;
  GetProfileController getProfileController = GetProfileController();
  bool loading = true;

  double textfieldsize = 40;
  double fontsize = 16;
  List<String> items = ['5', '4', '3', '2', '1'];
  String? selectedItem;

  // late String txt;

  Future initialize(BuildContext context) async {
    getProfileController.getProfile(context).then((value) {
      setState(() {
        // _selectedValue = value.data[0].firstName as CountryModelData;

        getProfileController.firstname.text = value.data[0].firstName;
        getProfileController.surname.text = value.data[0].surname;
        getProfileController.address.text = value.data[0].address;
        getProfileController.phoneNumber.text = value.data[0].phoneNumber;
        getProfileController.email.text = value.data[0].email;
        getProfileController.countryName.text = value.data[0].countryName;
        loading = false;
      });
    });

    controller.getCountry().then((value) {
      setState(() {
        countryModel = value;
        countryList = value.data;
        print(value.data[0].countryName);
        _selectedValue = value.data.first;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // getProfileController.getProfile().then((value) {
    //   setState(() {
    initialize(context);
    // getProfileModel = value;
    //
    // print(value.data[0].firstName);
    // txt = value.data[0].firstName;
    // });
    // });

    super.initState();
  }

  // Future initialize(BuildContext context) async {
  //   getProfileController.getProfile().then((Profile) {
  //     setState(() {
  //       getProfileModel = Profile;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: (loading)
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: appThemeBlue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'CHANGE PERSONAL DETAILS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name *'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: textfieldsize,
                                child: TextField(
                                  maxLength: null,
                                  showCursor: true,
                                  controller: getProfileController.firstname,
                                  style: TextStyle(fontSize: fontsize),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
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
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Surname *'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: textfieldsize,
                                child: TextField(
                                  showCursor: true,
                                  controller: getProfileController.surname,
                                  style: TextStyle(fontSize: fontsize),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
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
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Address'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: textfieldsize,
                                child: TextField(
                                  showCursor: true,
                                  controller: getProfileController.address,
                                  style: TextStyle(fontSize: fontsize),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
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
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Country'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: textfieldsize,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                width: double.infinity,
                                child: DropdownButton<CountryModelData>(
                                  // value: _selectedValue.,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  underline: Container(),
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  // Initial Value
                                  hint: Text(
                                    // _selectedValue.countryName,
                                    getProfileController.countryName.text,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Down Arrow Icon
                                  icon: Icon(Icons.keyboard_arrow_down),

                                  items: countryList
                                      .map<DropdownMenuItem<CountryModelData>>(
                                          (CountryModelData items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items.countryName),
                                    );
                                  }).toList(),

                                  onChanged: (newValue) {
                                    setState(() async {
                                      _selectedValue = newValue!;
                                    });
                                  },
                                  //
                                  //
                                  // items: items.map((String items) {
                                  //   return DropdownMenuItem(
                                  //     value: items,
                                  //     child: Text(items),
                                  //   );
                                  // }).toList(),
                                  //
                                  // onChanged: (String? newValue) {
                                  //   setState(() {
                                  //     selectedItem = newValue!;
                                  //   });
                                  // },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Phone'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: textfieldsize,
                                child: TextField(
                                  showCursor: true,
                                  controller: getProfileController.phoneNumber,
                                  style: TextStyle(fontSize: fontsize),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appThemeBlue, width: 1.0),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('E-mail *'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: textfieldsize,
                                child: TextField(
                                  showCursor: true,
                                  controller: getProfileController.email,
                                  style: TextStyle(fontSize: fontsize),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 5, right: 5),
                                    hintText: 'test@gmail.com',
                                    hintStyle: TextStyle(fontSize: 16),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(7)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appThemeBlue, width: 1.0),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('* mandatory field'),
                              Text(
                                  'Your personal details will not be shown publicly'),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: appThemelightPink,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 4.0),
                                        child: Text(
                                          'CANCEL',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      getProfileController.submit(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: appThemeteal,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 4.0),
                                        child: Text(
                                          'SUBMIT',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
