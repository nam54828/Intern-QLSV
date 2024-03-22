import 'package:get/get.dart';
import 'package:template/presentation/pages/subject/add/add_subject_controller.dart';

class AddSubjectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddSubjectController());
  }
}