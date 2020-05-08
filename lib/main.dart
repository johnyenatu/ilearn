import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ilearn/HomePage.dart';
import 'package:ilearn/localization/app_translations.dart';
import 'package:ilearn/localization/application.dart';
import 'package:ilearn/localization/appt_translations_delegate.dart';
import 'package:ilearn/pages/school/grade.dart';
import 'package:ilearn/pages/school/shool.dart';
import 'package:ilearn/pages/student/StudentHome.dart';
import 'package:ilearn/pages/student/StudentHome.dart';
import 'package:ilearn/pages/teacher/TeacherHome.dart';
import 'package:ilearn/pages/teacher/TeacherRegister.dart';
import 'package:ilearn/utils/LanguageFile.dart';
import 'package:ilearn/utils/RouteLink.dart';
import 'package:ilearn/utils/SharedPreferenccHelper.dart';
import 'package:ilearn/utils/ThemeUtility.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/rendering.dart';
void main() => runApp(MyApp());

//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        theme: ThemeData(primarySwatch: Colors.orange),
//        debugShowCheckedModeBanner: false,
//        home: HomePage());
//  }
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}
class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

@override
  void initState() {
    // TODO: implement initState
  //  super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }
  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      defaultThemeId: AppTheme.light().id,
//      onInitCallback: (controller, previouslySavedThemeFuture) async {
//        // Do some other task here if you need to
//        String savedTheme = await previouslySavedThemeFuture;
//        if (savedTheme != null) {
//          controller.setTheme(savedTheme);
//        }
//      },
      themes:  ThemeUtility.getThemes(),
      
        child: MaterialApp(
          routes: {
            RouteLink.ROUTE_STUDENT:(context)=>ThemeConsumer(child: StudentHome()),
          },
          home: ThemeConsumer(
            child: HomePage1(
            ),
          ),
          localizationsDelegates: [
            _newLocaleDelegate,
            //provides localised strings
            GlobalMaterialLocalizations.delegate,
            //provides RTL support
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale("en", ""),
            const Locale("am", ""),
          ],

        ),
       

    );
  }

}

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  static final Color primaryColor = Color(0xffFD6592);
  static final Color bgColor = Color(0xffF9E0E3);
  static final Color secondaryColor = Color(0xff324558);
  static final Color primary = Colors.white;
  static final Color active = Colors.grey.shade800;
  static final Color divider = Colors.grey.shade600;
  static String customerName = "customer";

  static List<String> languagesList = application.supportedLanguages;
  static List<String> languageCodesList =
      application.supportedLanguagesCodes;
  Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };
  @override
  Widget build(BuildContext context) {
    return ThemeConsumer(
      child: Scaffold(
      drawer:_buildDrawer(context),// _buildDrawer(context),
   //   drawer:
        appBar: AppBar(title: Text('iLearn')),
        body: GradePage(),
       floatingActionButton: buildBoomMenu(),
      )
    );
  }
  BoomMenu buildBoomMenu() {
    return BoomMenu(
      fabAlignment: Alignment.topRight,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        //child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        //  scrollVisible: scrollVisible,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          MenuItem(
//          child: Icon(Icons.accessibility, color: Colors.black, size: 40,),
            child: Image.asset('assets/logout_icon.png', color: Colors.grey[850]),
            title: "Logout",
            titleColor: Colors.grey[850],
            subtitle: "Lorem ipsum dolor sit amet, consectetur",
            subTitleColor: Colors.grey[850],
            backgroundColor: Colors.grey[50],
            onTap: () => print('THIRD CHILD'),
          ),
          MenuItem(
            child: Image.asset('assets/schemes_icon.png', color: Colors.white),
            title: "List",
            titleColor: Colors.white,
            subtitle: "Lorem ipsum dolor sit amet, consectetur",
            subTitleColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
            onTap: () => print('FOURTH CHILD'),
          ),
          MenuItem(
            child: Image.asset('assets/customers_icon.png', color: Colors.grey[850]),
            title: "Team",
            titleColor: Colors.grey[850],
            subtitle: "Lorem ipsum dolor sit amet, consectetur",
            subTitleColor: Colors.grey[850],
            backgroundColor: Colors.grey[50],
            onTap: () => print('THIRD CHILD'),
          ),
          MenuItem(
            child: Image.asset('assets/profile_icon.png', color: Colors.white),
            title: "Profile",
            titleColor: Colors.white,
            subtitle: "Lorem ipsum dolor sit amet, consectetur",
            subTitleColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: () => print('FOURTH CHILD'),
          )
        ]
    );
  }



Widget _buildDrawer(BuildContext context) {
  //  final String image = images[0];ing
  final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
  //ThemeProvider.controllerOf(context).nextTheme();
  //getnames();
 // builder: (_) => ThemeConsumer(child: ThemeDialog());
  return ClipPath(
    //clipper: OvalRightBorderClipper(),
   // ThemeConsumer(child: _buildDivider()),


      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,

            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: ThemeConsumer(
                        child: IconButton(
                          icon: Icon(
                            Icons.power_settings_new,
                            color: active,
                          ),
                          onPressed:() => {},
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])),
                      child: CircleAvatar(
                        radius: 40,
                        //   backgroundImage: CachedNetworkImageProvider(image),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Student Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'GR 11',
                      style: TextStyle(color: active, fontSize: 16.0),
                    ),
                    SizedBox(height: 30.0),
                    _buildRow(Icons.home, "Home",
                    ),
                    _buildDivider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:ThemeConsumer(
                      child: GestureDetector(
                        child: Row(children: [
                          Icon(
                            Icons.people_outline,
                            color: active,

                          ),
                          SizedBox(width: 10.0),
                          Text('Teacher',
                              style: tStyle
                          ),
                          Spacer(),

                        ],),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ThemeConsumer(child:TeacherRegister() ),
                            ),
                          );
                        },
                      )),

                    ),
                    _buildDivider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:ThemeConsumer(
                          child: GestureDetector(
                            child: Row(children: [
                              Icon(
                                Icons.people,
                                color: active,

                              ),
                              SizedBox(width: 10.0),
                              Text('Parent',
                                  style: tStyle
                              ),
                              Spacer(),

                            ],),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ThemeConsumer(child:TeacherHome() ),
                                ),
                              );
                            },
                          )),

                    ),
                    _buildDivider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:ThemeConsumer(
                          child: GestureDetector(
                            child: Row(children: [
                              Icon(
                                Icons.school,
                                color: active,

                              ),
                              SizedBox(width: 10.0),
                              Text('School',
                                  style: tStyle
                              ),
                              Spacer(),

                            ],),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ThemeConsumer(child:TeacherHome() ),
                                ),
                              );
                            },
                          )),

                    ),
                    _buildDivider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        child: Row(children: [
                          Icon(
                            Icons.category,
                            color: active,

                          ),
                          SizedBox(width: 10.0),
                          Text(
                              'Student',
                              style: tStyle
                          ),
                          Spacer(),

                        ],),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ThemeConsumer(child:StudentHome() ),
                            ),
                          );
                        },
                      ),

                    ),
                    _buildDivider(),
                    ThemeConsumer(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          child: Row(children: [
                            Icon(
                              Icons.language,
                              color: active,

                            ),
                            SizedBox(width: 10.0),
                            Text(
                                 'Themes'
                            ),
                            Spacer(),

                          ],),
                          onTap: () {
                           // _showLanguageChangeDailog(context);
                            //ThemeProvider.controllerOf(context).nextTheme;
                            showDialog(
                                context: context,
                                builder: (_) => ThemeConsumer(child: ThemeDialog()));
                          },
                        ),

                      ),
                    ),
                    _buildDivider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        child: Row(children: [
                          Icon(
                            Icons.language,
                            color: active,

                          ),
                          SizedBox(width: 10.0),
                          Text(
                              AppTranslations.of(context).text(
                                  LanguageFile.COMMON_CHANGE_LANGUAGE),
                              style: tStyle
                          ),
                          Spacer(),

                        ],),
                        onTap: () {
                          _showLanguageChangeDailog(context);
                        },
                      ),

                    ),
                    _buildDivider(),
                    _buildRow(Icons.person_pin, "My profile"),
                    _buildDivider(),
                    _buildRow(Icons.message, "Messages", showBadge: true),
                    _buildDivider(),
                    _buildRow(Icons.notifications, "Notifications",
                        showBadge: true),
                    _buildDivider(),
                    _buildRow(Icons.settings, "Settings"),
                    _buildDivider(),
                    _buildRow(Icons.email, "Contact us"),
                    _buildDivider(),
                    _buildRow(Icons.info_outline, "Help"),
                    _buildDivider(),
                  ],
                ),
              ),
            ),
          ),
        ),


  );
}


Divider _buildDivider() {
  return Divider(
    color: divider,
  );
}

Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
  final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
  return   Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,

        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),

      ]),

  );
}


Future<void> _showLanguageChangeDailog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(AppTranslations.of(context).text(
            LanguageFile.COMMON_CHANGE_LANGUAGE)),
        content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Select language.'),



                DropdownButton<String>(

                  items: [

                    DropdownMenuItem<String>(

                      child: Text('Amharic'),

                      value: 'Amharic',

                    ),

                    DropdownMenuItem<String>(

                      child: Text('English'),

                      value: 'English',

                    ),



                  ],

                  onChanged: (String value) {

                    _select(value);

                  },

                  hint: Text('Select Item'),

                  // value: _value,

                ),
              ],
            )

        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
          ,
        ]
        ,
      );
    },
  );
}
  void _select(String language) {
    //  print("dd "+language);
    onLocaleChange(Locale(languagesMap[language]));

    setState(() {
      if(language=="Amharic"){
        SharedPreferencHelper.setLanguageId("2");
      }else{
        SharedPreferencHelper.setLanguageId("1");
      }
      Navigator.pushNamed(context, RouteLink.ROUTE_HOMME);

    });
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      AppTranslations.load(locale);
    });
  }
}
