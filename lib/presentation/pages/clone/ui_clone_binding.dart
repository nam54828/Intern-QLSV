import 'package:get/get.dart';
import 'package:template/presentation/pages/clone/ui_clone_controller.dart';

class UICloneBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UICloneController());
  }
}