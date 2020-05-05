
import 'package:flutter/material.dart';
import 'package:ilearn/Employee.dart';
import 'package:ilearn/EmployeeBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose(){
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: StreamBuilder<List<Employee>>(
        stream: _employeeBloc.employeeListStream,
        builder: (BuildContext context,AsyncSnapshot<List<Employee>> snapshot){
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
//          switch (snapshot.connectionState) {
//            case ConnectionState.none: return Text('Select lot');
//            case ConnectionState.waiting: return Text('Awaiting bids...');
//            case ConnectionState.active: return Text('\$${snapshot.data.length}');
//            case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
//          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].name}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                         children: <Widget>[
                           Text(
                             "${snapshot.data[index].name}",
                             style: TextStyle(fontSize: 20.0),
                           ),
                           Text(
                             "${snapshot.data[index].salary}",
                             style: TextStyle(fontSize: 20.0),
                           ),
                         ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: IconButton(
                          icon: Icon(Icons.thumb_up,
                          color: Colors.green,

                          ),
                          onPressed: (){
_employeeBloc.employeeSalaryInc.add(snapshot.data[index]);
                          },
                        )
                      ),
                      Container(
                          padding: EdgeInsets.all(20.0),
                          child: IconButton(
                            icon: Icon(Icons.thumb_down,
                              color: Colors.red,

                            ),
                            onPressed: (){
_employeeBloc.employeeSararyDec.add(snapshot.data[index]);
                            },
                          )
                      ),

                    ],
                  ),
                );
                
              });
        },
      ),
    ));
  }
}

