import 'dart:convert';

import 'package:fcis2023/model/usermodel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class localstorage extends GetxController{
  static const USER_DATA="user";

  Future<UserModel?> get getuser async {
    try {
      UserModel user=await getuserdata();
      print(user);
      return user;
    }
    catch(e) {
      // #################
      print(e.toString());
      return null;
    }
  }
  getuserdata()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var value=await preferences.getString(USER_DATA);
    return UserModel.fromjson(json.decode(value!));
  }

  setuser(UserModel user)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    // ##################
    print(user.firstname);
    await preferences.setString(USER_DATA, json.encode(user.toJson()));
  }

  deleteuser()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    await preferences.clear();
  }
}