import 'package:fcis2023/model/courseDetail.dart';
import 'package:fcis2023/services/remote_services.dart';
import 'package:get/get.dart';

class CourseDetailController extends GetxController{
  var course_detail=<CourseDetailModel>[].obs;
  Rx<String>? abb;
  var isloaded=false.obs;

  CourseDetailController(String abb){
    this.abb=abb.obs  ;
  }
  void fetchCourseDetails(Rx<String>? abbr)async{
    var detail=await RemotesService.fetchCourseDetails(abbr);
    if(detail!=null)
    course_detail.value=detail;
  }
  @override
  void onInit() {
    fetchCourseDetails(abb!);
    isloaded=true.obs;
    super.onInit();
  }
}