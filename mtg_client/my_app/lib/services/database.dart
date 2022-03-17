import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      print(_doc.data());
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
