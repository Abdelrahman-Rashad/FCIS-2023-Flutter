import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcis2023/controller/local_storage.dart';
import 'package:fcis2023/model/usermodel.dart';
import 'package:fcis2023/view/Home.dart';
import 'package:fcis2023/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/firestore_user.dart';

  final localstorage local=Get.put(localstorage());

class AuthController extends GetxController{

  static AuthController instance = Get.find();
  FirebaseAuth _auth=FirebaseAuth.instance;
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user =Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if(user==null){
      print("login page");
      Get.offAll(()=>Login());
    }else{
      Get.offAll(()=>Home());
    }
  }

  void SignUp(String firstname,String lastname,String email,String password)async{
    try {
      
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value)async{
        UserModel usermodel=new UserModel(
          userid: value.user!.uid,
          email: value.user!.email,
          firstname: firstname,
          lastname: lastname,
          );
        await firestoreuser().adduser(usermodel);
        setuser(usermodel);
      }
        );

    }on FirebaseAuthException catch(e){
      Get.snackbar("About User", "User message",backgroundColor: Colors.teal,snackPosition: SnackPosition.BOTTOM,titleText: Text("Account creation failed",style: TextStyle(color:Colors.white)),messageText: Text(e.message.toString(),style: TextStyle(color:Colors.white)));
    }
  }

  void login(String email,String password)async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value)async{
        //await firestoreuser().getcurrentuser(value.user!.uid).then((v) {setuser(UserModel.fromjson(v.data() as Map<dynamic, dynamic>));});
        await firestoreuser().getcurrentuser(value.user!.uid).then((val) {val.listen((event) { setuser(UserModel.fromjson(event.data()as Map<dynamic, dynamic>));});});
      });
    }on FirebaseAuthException catch(e){
      Get.snackbar("About Login", "Login message",backgroundColor: Colors.teal,snackPosition: SnackPosition.BOTTOM,titleText: Text("Login failed",style: TextStyle(color:Colors.white)),messageText: Text(e.message.toString(),style: TextStyle(color:Colors.white)));
    }
  }

  Future forgotpassword(String email,BuildContext context)async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Password reset link send! Check your email"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        }
      );
    }on FirebaseAuthException catch(e){
      Get.snackbar("About Login", "Login message",backgroundColor: Colors.teal,snackPosition: SnackPosition.BOTTOM,titleText: Text("Reset password failed",style: TextStyle(color:Colors.white)),messageText: Text(e.message.toString(),style: TextStyle(color:Colors.white)));
    }
  }

  void logout()async{
    await _auth.signOut();
    local.deleteuser();
  }

  void setuser(UserModel usermodel)async{
    await local.setuser(usermodel);
    SharedPreferences preferences=await SharedPreferences.getInstance();
    print(preferences.getString("user"));
    print("###########################################");
  }
  
}