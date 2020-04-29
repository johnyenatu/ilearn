
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';


class StudentHome extends StatefulWidget {

  const StudentHome({
    Key key,
  }) : super(key: key);

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Home'),
      ),
      body: RaisedButton(
        child: Text("Next Theme"),
     onPressed:() => ThemeProvider.controllerOf(context).nextTheme,
    ),

    );
  }
}
