import 'package:fcis2023/controller/usercontroller.dart';
import 'package:fcis2023/model/usermodel.dart';
import 'package:fcis2023/services/firestore_user.dart';
import 'package:fcis2023/view/Home.dart';
import 'package:fcis2023/view/Widgets/MyAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatelessWidget {
  profile({Key? key}) : super(key: key);

  final usercontroller user = Get.put(usercontroller());
  UserModel? userdata;
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.off(() => Home());
                      },
                      icon: Icon(Icons.arrow_back))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    child: StreamBuilder(
                      stream: user.stream.value.stream,
                      builder: (BuildContext contex,
                          AsyncSnapshot<UserModel> snapshot) {
                        userdata = snapshot.data;
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: SingleChildScrollView(
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  ClipPath(
                                  clipper: CustomShape(),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    color: Colors.teal,
                                  ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height:110),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 7,
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/profile.jpg"),
                                              )),
                                        ),
                                        Text(
                                            "${userdata?.firstname} ${userdata?.lastname}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text("${userdata?.email}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 50.0),
                                    child: ElevatedButton(
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (context) {
                                              return MyAlertDialog(
                                                  firstnameController:
                                                      firstnameController,
                                                  lastnameController:
                                                      lastnameController,
                                                  userdata: userdata);
                                            }),
                                        child: Text("Update Userame")),
                                  ),
                                  ),
                                      ],
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
