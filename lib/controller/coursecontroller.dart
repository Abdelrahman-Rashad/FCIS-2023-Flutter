import 'package:fcis2023/model/course.dart';
import 'package:fcis2023/services/remote_services.dart';
import 'package:get/get.dart';

class coursecontroller extends GetxController{
  var CourseList= <Course>[].obs;
  var foundcourse= <Course>[].obs;
  var isloaded=false.obs;
  @override
  void onInit() {
    fetchCourses();
    isloaded=true.obs;
    foundcourse.value=CourseList;
    super.onInit();
  }
  void fetchCourses()async{
    var Courses=await RemotesService.fetchCourses();
    if(Courses!=null)
    CourseList.value=Courses;
  }

  void searchcourse(String query){
    var courses= <Course>[].obs;
    if(query.isEmpty){
      courses=CourseList;
    }else{
    courses=CourseList.where((course) {
    final titlelower=course.name!.toLowerCase();
    final searchlower=query.toLowerCase();
    return titlelower.contains(searchlower);
    }
    ).toList().obs;
    }
    foundcourse.value=courses;
  }
  
}