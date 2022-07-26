import 'dart:async';

import 'package:fcis2023/controller/local_storage.dart';
import 'package:fcis2023/model/usermodel.dart';
import 'package:get/get.dart';

  final localstorage local=Get.put(localstorage());

class usercontroller extends GetxController{
  /*var usermodel;
  var isloaded=false.obs;


  @override
  void onInit() {
    GetCurrentUser();
    isloaded=true.obs;
    super.onInit();
    
  }
  
  Future<void> GetCurrentUser()async {
    
    await local.getuser.then((value){
      if(value==null)
      return null;
      print(value.firstname);
      usermodel=value.obs ;
    });
    
  }*/
  Rx<StreamController<UserModel>> stream = new StreamController<UserModel>().obs;


  @override
  void onInit()async {
    await GetCurrentUser();
    super.onInit();
    
  }
  
  Future<void> GetCurrentUser()async {
    
    await local.getuser.then((value){
    
      print(value?.firstname);
      stream.value.sink.add(value!)  ;
    });
    
  }
}