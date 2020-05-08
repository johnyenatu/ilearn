
//TODO: imports

//TODO: List of employees

//TODO: Stream controllers


//TODO:Stream Sink getter


//TODO: Constructor -add data; listen to changes


//TODO Core functions


//TODO:  Dispose

import 'dart:async';
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilearn/model/model_school.dart';
import 'package:ilearn/resources/repository.dart';
class SchoolBloc {
 final _repository = Repository();

List<ModelSchool> schoolList=[];
  Future<List<ModelSchool>> getSchoolList()async {
await _repository.getSchoolsList()
.then((QuerySnapshot snapshot) async{
    snapshot.documents.toList().forEach((f)=>{
     schoolList.add( ModelSchool(f.documentID.toString()))
    });
  });
 return   schoolList;
  }

final _schoolListStreamController=StreamController<List<ModelSchool>>();  

final _schoolListAddController=StreamController<ModelSchool>();
final _schoolListDeleteController=StreamController<ModelSchool>();

Stream<List<ModelSchool>> get schoolListStream
=> _schoolListStreamController.stream;

StreamSink<List<ModelSchool>> get schoolListSink
  => _schoolListStreamController.sink;


StreamSink<ModelSchool> get addschoolListSink
=> _schoolListAddController.sink;

StreamSink<ModelSchool> get deleteSchoolSink=> _schoolListDeleteController.sink;


SchoolBloc(){
   getSchoolList();
  _schoolListStreamController.add(schoolList);
  _schoolListAddController.stream.listen(_addSchool);
  _schoolListDeleteController.stream.listen(_deleteSchool);
}
_addSchool(ModelSchool  school) async{
 await _repository.addSchool(school.name);
  //  getSchoolList();
 // schoolList.add(school);
 updateList();
}

_deleteSchool(ModelSchool school) async{
 print("${school.name} is deleted");
 await _repository.deleteSchool(school.name);
 //schoolList.remove(school);
updateList();

}
void updateList() async{
  schoolList=[];
    await _repository.getSchoolsList()
        .then((QuerySnapshot snapshot) async{
      snapshot.documents.toList().forEach((f)=>{
        schoolList.add( ModelSchool(f.documentID.toString()))
      });

    });
  schoolListSink.add(schoolList);

  print('List updated==='+schoolList.length.toString());
}
 
void dispose(){
  _schoolListStreamController.close();
}


}