import 'package:fcis2023/view/Home.dart';
import 'package:fcis2023/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void SignUp(String email,String password)async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",backgroundColor: Colors.teal,snackPosition: SnackPosition.BOTTOM,titleText: Text("Account creation failed",style: TextStyle(color:Colors.white)),messageText: Text(e.toString(),style: TextStyle(color:Colors.white)));
    }
  }

  void login(String email,String password)async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",backgroundColor: Colors.teal,snackPosition: SnackPosition.BOTTOM,titleText: Text("Login failed",style: TextStyle(color:Colors.white)),messageText: Text(e.toString(),style: TextStyle(color:Colors.white)));
    }
  }

  void logout()async{
    await _auth.signOut();
  }
}