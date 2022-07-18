import 'package:fcis2023/controller/authcontroller.dart';
import 'package:fcis2023/controller/coursedetailcontroller.dart';
import 'package:fcis2023/model/course.dart';
import 'package:fcis2023/view/Widgets/coursedetailbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetail extends StatelessWidget {
  CourseDetail({Key? key, required this.course,required this.backgroundimage}) : super(key: key);
  final Course course;
  final String backgroundimage;
  late final CourseDetailController coursedetailcontrol =
      Get.put(CourseDetailController(course.abb.toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(backgroundimage),
                      colorFilter: ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
             
              coursedetialbody(course: course,control: coursedetailcontrol,con: context),
               Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
              ),
            ],
          )
        ),
      ),
    );
  }
}
