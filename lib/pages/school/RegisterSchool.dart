import 'package:flutter/material.dart';
import 'package:ilearn/pages/student/Assignment.dart';
import 'package:ilearn/pages/student/StudentResource.dart';



class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [

                Tab(icon: Icon(Icons.receipt),
                text: 'Resourece',),
                Tab(icon: Icon(Icons.assessment),
                text: 'Assignment',),
              ],
            ),
            title: Text('Student Page'),
          ),
          body: TabBarView(
            children: [
              StudentAssignment(),
              StudentResource(),
            ],
          ),
        ),
      ),
    );
  }
}