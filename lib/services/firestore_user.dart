import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcis2023/model/usermodel.dart';

class firestoreuser {
  final CollectionReference _usercollection = FirebaseFirestore.instance.collection("users");

  Future<void> adduser(UserModel user)async{
    return await _usercollection.doc(user.userid).set(user.toJson());
  }

  Future<void> updateuser(UserModel user)async{
    return await _usercollection.doc(user.userid).update(user.toJson());
  }

  Future<Stream<DocumentSnapshot>> getcurrentuser(String uid)async{
    // return await _usercollection.doc(uid).get();
    return await FirebaseFirestore.instance.collection("users").doc(uid).snapshots();
  }
}