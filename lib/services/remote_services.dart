import 'package:fcis2023/model/course.dart';
import 'package:fcis2023/model/courseDetail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemotesService { 
  static var client =http.Client();

  static Future<List<Course>?> fetchCourses()async {
    String url='https://raw.githubusercontent.com/omarr45/FCIS6thData/master/courses.json?fbclid=IwAR18NWkPkNKh-m1jZ86RpZf5PyGaNR8eNmnxganj1ahsNlnPVK1P8d0Sr7g';
    var response=await client.get(Uri.parse(url));
    if(response.statusCode==200){
      var jsonstring = response.body;
      return courseFromJson(jsonstring);
    }else{
      return null;
    }
  }
  static Future<List<CourseDetailModel>?> fetchCourseDetails(Rx<String>? abb)async {
    String url='https://raw.githubusercontent.com/omarr45/FCIS6thData/master/$abb.json?fbclid=IwAR2QaCtvxDo8q25lM7uvdBVKsSrBMGrtyIy9x_ArZ0_P5TYXatw8-q6RbiQ';
    var response=await client.get(Uri.parse(url));
    if(response.statusCode==200){
      var jsonstring = response.body;
      return courseDetailFromJson(jsonstring);
    }else{
      return null;
    }
  }
}