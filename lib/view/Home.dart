import 'package:fcis2023/controller/authcontroller.dart';
import 'package:fcis2023/controller/coursecontroller.dart';
import 'package:fcis2023/controller/usercontroller.dart';
import 'package:fcis2023/model/usermodel.dart';
import 'package:fcis2023/view/Widgets/Course_Card.dart';
import 'package:fcis2023/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final coursecontroller coursecontrol = Get.put(coursecontroller());
  var x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(() => profile());
                              },
                              icon: Icon(Icons.person),
                            ),
                            IconButton(
                                onPressed: () {
                                  AuthController.instance.logout();
                                },
                                icon: Icon(Icons.logout)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          "FCIS 2023",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                        child: Text("Find a course you want to learn",
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: CupertinoSearchTextField(
                              borderRadius: BorderRadius.circular(20),
                              onChanged: (value) {
                                coursecontrol.searchcourse(value);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Obx(() {
                  return Visibility(
                    visible: coursecontrol.isloaded.value,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: coursecontrol.foundcourse.length,
                        itemBuilder: (context, index) {
                          return CourseCard(
                              course: coursecontrol.foundcourse[index],
                              index: index);
                        }),
                    replacement: CircularProgressIndicator(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
