import 'package:fcis2023/model/course.dart';
import 'package:fcis2023/view/course_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCard extends StatelessWidget {
  CourseCard({Key? key, required this.course, required this.index})
      : super(key: key);
  Course course;
  int index;
  List<String> colorList = [
    "assets/SW.jpg",
    "assets/Algo.jpg",
    "assets/HPC.jpg",
    "assets/Concept.jpg",
    "assets/CV.jpeg",
    "assets/DA.jpeg",
    "assets/DC.jpeg",
    "assets/DM.jpeg",
    "assets/DS.jpeg",
    "assets/ES.jpeg",
    "assets/ML.jpeg",
    "assets/graphics.jpg",
    "assets/Network.jpg",
    "assets/NLP.jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: GestureDetector(
        onTap: (){Get.to(()=>CourseDetail(course: course,backgroundimage: colorList[index],));},
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 5, spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
                image: AssetImage(colorList[index]),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${course.name}",
                    style: Theme.of(context).textTheme.headline2),
                Text("${course.doctorName}",
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
