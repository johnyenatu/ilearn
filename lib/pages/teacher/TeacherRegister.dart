import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ilearn/localization/app_translations.dart';
import 'package:ilearn/localization/application.dart';
import 'package:ilearn/utils/LanguageFile.dart';
import 'package:ilearn/utils/SharedPreferenccHelper.dart';
import 'package:ilearn/utils/ThemeUtility.dart';
import 'package:intl/intl.dart';
import 'package:theme_provider/theme_provider.dart';


// Create a Form widget.
class TeacherRegister extends StatefulWidget {
  @override
  RegisterCustomerState createState() {
    return RegisterCustomerState();
  }
}

class RegisterCustomerState extends State<TeacherRegister> {

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController schoolController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confPassController = new TextEditingController();
  TextEditingController imeiController = new TextEditingController();
  TextEditingController ssnController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      child: Form(
        key: _formKey,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar(
            actions: <Widget>[


            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0),

                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 10, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text( 'iLearn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeProvider.themeOf(context).data.accentColor,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(60, 10.0, 60, 10),
                          child: Center(
                            child: Text('iLearn',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[600],
                                fontSize: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0),
                        child: new Text(
                          AppTranslations.of(context).text(LanguageFile.FULL_NAME),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0),
                        child: new TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppTranslations.of(context)
                                  .text('form_enter_full_name');
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0),
                        child: new Text(
                          AppTranslations.of(context).text('company_name'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0),
                        child: new TextFormField(
                          controller: schoolController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppTranslations.of(context)
                                  .text('form_enter_org_name');
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: new Text(
                          AppTranslations.of(context)
                              .text(LanguageFile.MOBILE_NUMBER),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0),
                        child: new TextFormField(
                          keyboardType: TextInputType.number,
                          controller: mobileController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppTranslations.of(context)
                                  .text(LanguageFile.ENTER_MOBILE);
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        //    padding: const EdgeInsets.only(left: 40.0),

                        padding: EdgeInsets.fromLTRB(40, 0, 30, 0),
                        child: new Text(
                          AppTranslations.of(context).text(LanguageFile.PASSWORD),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: new TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppTranslations.of(context)
                                  .text(LanguageFile.ENTER_PASSWORD);
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),


                Divider(
                  height: 0.0,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: const EdgeInsets.fromLTRB(100, 5, 100, 0),
                  child: RaisedButton(
                    color: Colors.blue[600],
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.grey,
                    onPressed: () async {
//                      bool con = await ConnectivityUtil.isConnected();
//                      String imei = await PhoneUtility.getIMEI();
//                      String ssn = await PhoneUtility.getId();

                    },
                    child: Text(AppTranslations.of(context)
                        .text(LanguageFile.BUTTON_REGISTER)),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: const EdgeInsets.fromLTRB(100, 5, 100, 0),
                  child: RaisedButton(
                    color: Colors.blue[600],
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.grey,
                    onPressed: () async {
//                      String imei = await PhoneUtility.getIMEI();
//                      var response = await FBCustomerService.isPhoneRegistered(imei);
////                      print('IMEI=='+imei);
////                      print('RESTPonse='+response.toString());
//                      if(!response){
//                        MyWidgets.showRedToast(' You need to Register first!!');
//                      }else{
//                        Navigator.pushNamed(context, RouteLink.ROUTE_LOGIN);
//                      }


                    },
                    child: Text(
                        AppTranslations.of(context).text(
                            LanguageFile.BUTTON_LOGIN)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
