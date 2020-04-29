import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teachers Screen 3"),

      ),
      body: Center(
        child: RaisedButton(
          child: Text("Next Theme"),
           onPressed:() => ThemeProvider.controllerOf(context).nextTheme,
        ),

      ),
      //floatingActionButton: buildBoomMenu(),
    );
  }
}



class TeacherHome1 extends StatelessWidget {

  const TeacherHome1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teachers Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Next Theme"),
          //onPressed:() => ThemeProvider.controllerOf(context).nextTheme,
        ),

      ),
      //floatingActionButton: buildBoomMenu(),
    );
  }

}