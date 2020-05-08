
import 'package:flutter/material.dart';
import 'package:ilearn/bloc/grade_bloc.dart';
import 'package:ilearn/bloc/school_bloc.dart';
import 'package:ilearn/model/model_grade.dart';
import 'package:ilearn/model/model_school.dart';




class GradePage extends StatefulWidget {
  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  //final EmployeeBloc _employeeBloc = EmployeeBloc();

  final GradeBlock _gradeBlock= GradeBlock();

  @override
  void dispose(){
    _gradeBlock.dispose();
    super.dispose();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade in school'),
      ),
        body: Container(
      child: StreamBuilder<List<Grade>> (
        stream:   _gradeBlock.gradeListStream,
        builder: (BuildContext context,AsyncSnapshot<List<Grade>> snapshot){
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
//          switch (snapshot.connectionState) {
//            case ConnectionState.none: return Text('Select lot');
//            case ConnectionState.waiting: return Text('Awaiting bids...');
//            case ConnectionState.active: return Text('\$ size ==${snapshot.data.length}');
//            case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
//          }
          //if(snapshot.connectionState != ConnectionState.done){


//int n=0;
//          while(n<0){
//            if(n==0){
//              return Center(
//                child: CircularProgressIndicator(strokeWidth: 6,
//
//                    backgroundColor: Colors.red[900]),
//              );
//            }
//
//            if(snapshot.hasData){
//
//              n++;
//            }
//          }
          if(!snapshot.hasData){
            print('"Has Data====');
            return Center(
              child: CircularProgressIndicator(strokeWidth: 6,

                  backgroundColor: Colors.red[900]),
            );
          }else{
            print('"Has Data====');
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
                            "${snapshot.data[index].schoolName}",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "mm ${snapshot.data[index].gradeName}",
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
                                _gradeBlock.gradeAddStreamSink.add(Grade('123',"${snapshot.data[index].schoolName}"));
                                //  grade.addschoolListSink.add(ModelSchool('Hello Student University'));
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
                                //  _gradeBlock.gradeAddStreamSink.add(Grade('123',"${snapshot.data[index].schoolName}"));
                                _gradeBlock.gradeDeleteStreamSink.add(Grade('123',"${snapshot.data[index].schoolName}"));
                                // _schoolBloc.deleteSchoolSink.add(ModelSchool("${snapshot.data[index].name}"));
                              },
                            )
                        ),

                      ],
                    ),
                  );

                });
          }





        },
      ),
    ));
  }
}

