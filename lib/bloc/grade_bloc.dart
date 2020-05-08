


//TODO: imports

//TODO: List of Grade

//TODO: Stream controllers


//TODO:Stream Sink getter


//TODO: Constructor -add data; listen to changes


//TODO Core functions


//TODO:  Dispose

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model_grade.dart';
 import 'package:ilearn/resources/repository.dart';



class GradeBlock{
 final _repository = Repository();

List<Grade> gradeList=[];
Future<List<Grade>> getGradeBySchoolName(String schoolName) async{
  print('"Prrrrrrrrrrrrrrrrrrrrrrrrrr='+schoolName);

  List<Grade> gradeList=[];
//  await _repository.getGradeListWithSchool(schoolName).then((QuerySnapshot snapshot)async
//  {
//    snapshot.documents.toList().forEach((val)=>{
//  print('SChool Name===='+schoolName),
//  print('Document ID=='+val.documentID),
//      gradeList.add(Grade(val.documentID,schoolName)),
//  });
//
//  }) ;



  await _repository.getGradeListWithSchool(schoolName).then((QuerySnapshot snapshot)async{
    snapshot.documents.toList().forEach((val)=>{
      print('SChool Name===='+schoolName),
      print('Document ID=='+val.documentID),
      gradeList.add(Grade(val.documentID,schoolName)),
      _gradeStreamController.add(gradeList),
   //   _gradeAddStreamController.sink.add(_addToList);
    });

  });

  print('Grade List Size=='+gradeList.length.toString());
    return   gradeList;

}


final _gradeStreamController= StreamController<List<Grade>>();

final _gradeAddStreamController=StreamController<Grade>();

final _gradeDeleteStreamController=StreamController<Grade>();


Stream<List<Grade>> get gradeListStream=>_gradeStreamController.stream;

StreamSink<List<Grade>> get gradeListStreamSink=>_gradeStreamController.sink;



Stream<Grade> get gradeAddStream=>_gradeAddStreamController.stream;
StreamSink<Grade> get gradeAddStreamSink=>_gradeAddStreamController.sink;




Stream<Grade> get gradeDeleteStream => _gradeDeleteStreamController.stream;
StreamSink<Grade> get gradeDeleteStreamSink=>_gradeDeleteStreamController.sink;


GradeBlock() {
    getGradeBySchoolName('Bahir Dar Acadamy');
  _gradeStreamController.add(null);
 // _gradeStreamController.stream.listen(onData)
  /// WRITTERN NOW .....................................
   // _gradeStreamController.stream.listen(_addGrade);
  _gradeAddStreamController.stream.listen(_addGrade);
  _gradeDeleteStreamController.stream.listen(_deleteSchool);

}
  _addGrade(Grade  grade) async{
    await _repository.addGrade(grade);
    updateList(grade.schoolName);
  }

  _deleteSchool(Grade grade) async{

    await _repository.deleteGrade(grade.gradeName);

    updateList(grade.schoolName);
  }

  void updateList(String schoolName) async{
    gradeList=[];

    await _repository.getGradeListWithSchool(schoolName)
        .then((QuerySnapshot snapshot) async{
      snapshot.documents.toList().forEach((val)=>{
        gradeList.add(Grade(val.documentID,"schoolName")),
      });

    });
  }
  void dispose(){
    _gradeAddStreamController.close();
    _gradeStreamController.close();
  _gradeDeleteStreamController.close();
  }

/// TIL...........................

}