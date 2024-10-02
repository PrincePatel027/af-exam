import 'package:af_exam/database/helper/db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbHelper {
  FirestoreDbHelper._();
  static FirestoreDbHelper firestoreDbHelper = FirestoreDbHelper._();

  FirebaseFirestore db = FirebaseFirestore.instance;

  addDataInFirestore({required List contacts}) async {
    List allContacts = contacts
        .map((e) => DbHelper.dbHelper.fetchSpecificData(id: e))
        .toList();

    allContacts.map((e) => db.collection("Contacts").doc().set(e));
  }
}
