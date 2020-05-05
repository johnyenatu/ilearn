
import 'package:ilearn/model/model_school.dart';
import 'package:ilearn/resources/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Repository {
    final _firestoreProvider = FirestoreProvider();


  Future<QuerySnapshot> getSchoolsList() => _firestoreProvider.getSchoolList();

  Future<void> addSchool(String name) =>
      _firestoreProvider.addSchool(name);


  Future<void> deleteSchool(String name)=>_firestoreProvider.deleteSchool(name);

}