import 'package:get/get.dart';
import 'package:template/presentation/pages/subject/update/update_subject_controller.dart';

class UpdateSubjectBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdateSubjectController());
  }
}