import 'package:fcis2023/controller/authcontroller.dart';
import 'package:fcis2023/controller/usercontroller.dart';
import 'package:fcis2023/model/usermodel.dart';
import 'package:fcis2023/services/firestore_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAlertDialog extends StatelessWidget {
   MyAlertDialog({Key? key,required this.firstnameController,required this.lastnameController,required this.userdata}) : super(key: key);
   var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  AuthController auth= Get.put(AuthController());
  final usercontroller user = Get.put(usercontroller());

  UserModel? userdata;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text('Update Data', style: Theme.of(context).textTheme.headline5),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'First Name')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Last Name')),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text("Cancle")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () async {
              UserModel usermodel = new UserModel(
                userid: userdata?.userid,
                email: userdata?.email,
                firstname: firstnameController.text.toString(),
                lastname: lastnameController.text.toString(),
              );
              await firestoreuser().adduser(usermodel);
              auth.setuser(usermodel);
              user.GetCurrentUser();
              Get.back();
            },
            child: Text("Ok"))
      ],
    );
  }

}
