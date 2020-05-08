import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilearn/model/model_grade.dart';
import 'package:ilearn/model/model_school.dart';

class FirestoreProvider {
  Firestore _firestore= Firestore.instance;

  Future<void> addSchool(String name) async {
    return _firestore
        .collection("school")
        .document(name)
        .setData({'NAME': name});
  }



  Future<void> deleteSchool(String name) async {
    return _firestore
        .collection("school")
        .document(name).delete();
  }






        Future<QuerySnapshot> getSchoolList() async {
    // List<ModelSchool> schoolList=[ModelSchool('Mulaudam')];
return await _firestore
      .collection("school")
      .getDocuments();
 
  }
 

//====================================Grade Providers
 Future<QuerySnapshot> getGradeListWithSchool(String schoolName)async{
   return  await _firestore
   .collection("school")
   .document(schoolName)
   .collection('grade')
   .getDocuments();
 }
  /// WRITTEEEEN NOW ....................
  Future<void> addGrade(Grade grade) async {
    return _firestore
        .collection('school')
        .document(grade.schoolName)
        .collection('grade')
        .document(grade.gradeName);

  }

  Future<void> deleteGrade(String name) async{
    return _firestore
        .collection('grade')
        .document(name).delete();
  }
///End of line...................


}