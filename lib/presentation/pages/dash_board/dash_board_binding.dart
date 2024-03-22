import 'package:get/get.dart';
import 'package:template/presentation/pages/clone/ui_clone_controller.dart';
import 'package:template/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:template/presentation/pages/home/home_controller.dart';
import 'package:template/presentation/pages/student/add/add_controller.dart';
import 'package:template/presentation/pages/student/student_controller.dart';
import 'package:template/presentation/pages/subject/add/add_subject_controller.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
    Get.put<UICloneController>(UICloneController());
    Get.put<HomeController>(HomeController());
    Get.put<StudentController>(StudentController());
    Get.put<AddController>(AddController());
    Get.put<SubjectController>(SubjectController());
    Get.put<AddSubjectController>(AddSubjectController());
  }
}
