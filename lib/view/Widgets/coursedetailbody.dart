import 'package:fcis2023/controller/coursedetailcontroller.dart';
import 'package:fcis2023/model/course.dart';
import 'package:fcis2023/model/courseDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class coursedetialbody extends StatelessWidget {
  coursedetialbody(
      {Key? key,
      required this.course,
      required this.control,
      required this.con})
      : super(key: key);

  Course course;
  CourseDetailController control;
  BuildContext con;
  List<IconData> listoficon = [
    Icons.play_circle_sharp,
    Icons.picture_as_pdf_sharp,
    Icons.add,
    Icons.insert_drive_file_sharp,
    Icons.folder_zip_sharp,
    Icons.code_sharp,
    Icons.menu_book_sharp,
    Icons.people_alt_sharp,
    Icons.play_arrow_rounded,
    Icons.school_sharp,
    Icons.file_present_sharp,
    Icons.assignment,
    
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.name.toString(),
                            style: Theme.of(context).textTheme.headline2),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(course.doctorName.toString(),
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Text(course.doctorEmail.toString(),
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      height: 600,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      child: Obx(() {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: ListView.builder(
                              itemCount: control.course_detail.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 4,
                                  
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  child: ExpansionTile(
                                    title: Text(
                                        "${control.course_detail[index].title}"),
                                    children: mylisttile(control.course_detail[index],context),
                                  ),
                                );
                              }),
                        );
                      }))
                ],
              ))
        ],
      ),
    );
  }

  List<Widget> mylisttile(CourseDetailModel course, BuildContext context)  {
    var list=<Widget>[];
    for (int i = 0; i < course.elements!.length; i++) {
       list.add(ListTile(
        leading: Icon(listoficon[course.elements![i].icon!.toInt()]),
        title: GestureDetector(
            child: Text(
              "${course.elements![i].title}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () async {
              var url = course.elements![i].link.toString();
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
      ));
    }
    return list;
  }
}
