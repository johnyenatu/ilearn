import 'package:cloud_firestore/cloud_firestore.dart';
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
 
}