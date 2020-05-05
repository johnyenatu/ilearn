
import 'package:flutter/material.dart';
import 'package:ilearn/bloc/school_bloc.dart';
import 'package:ilearn/model/model_school.dart';


 

class SchoolPage extends StatefulWidget {
  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  //final EmployeeBloc _employeeBloc = EmployeeBloc();

  final SchoolBloc _schoolBloc= SchoolBloc();

  @override
  void dispose(){
     _schoolBloc.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: StreamBuilder<List<ModelSchool>>(
        stream: _schoolBloc.schoolListStream,
        builder: (BuildContext context,AsyncSnapshot<List<ModelSchool>> snapshot){
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
//          switch (snapshot.connectionState) {
//            case ConnectionState.none: return Text('Select lot');
//            case ConnectionState.waiting: return Text('Awaiting bids...');
//            case ConnectionState.active: return Text('\$ size ==${snapshot.data.length}');
//            case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
//          }
        
          return ListView.builder(
              itemCount: snapshot.data!=null?snapshot.data.length:0,
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
                             "mm ${snapshot.data[index].name}",
                             style: TextStyle(fontSize: 20.0),
                           ),
                            
                         ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: IconButton(
                          icon: Icon(Icons.add_circle_outline,
                          color: Colors.green,

                          ),
                          onPressed: (){
                         //   _schoolB
                         _schoolBloc.addschoolListSink.add(ModelSchool('Hello Student University'));
                          },
                        )
                      ),
                      Container(
                          padding: EdgeInsets.all(20.0),
                          child: IconButton(
                            icon: Icon(Icons.delete,
                              color: Colors.red,

                            ),
                            onPressed: (){
                              _schoolBloc.deleteSchoolSink.add(ModelSchool("${snapshot.data[index].name}"));
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

