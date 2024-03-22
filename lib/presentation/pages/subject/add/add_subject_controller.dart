import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/model/subject/subject_model.dart';
import 'package:template/data/repositories/subject_repository.dart';
import 'package:template/presentation/pages/student/add/add_controller.dart';
import 'package:template/presentation/pages/student/student_controller.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';

class AddSubjectController extends GetxController {
  RxList<SubjectModel> subjectModel = <SubjectModel>[].obs;

  final SubjectRepository _subjectRepository = GetIt.I.get<SubjectRepository>();

  late final addStudentCtr = Get.find<AddController>();
  late final subjectCtrl = Get.find<SubjectController>();
  late final studentCtrl = Get.find<StudentController>();
  final formkey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController termController = TextEditingController();
  final TextEditingController creditController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();

  String? selectedRegistrationStatus;

  List<String> registrationStatuses = [
    "Đã xác nhận",
    "Chờ xác nhận",
    'Từ chối'
  ];

  Future<void> setSelectedRegistrationStatus(String? newValue) async {
    selectedRegistrationStatus = newValue;
  }

  Future<void> addSubject(SubjectModel subjectModel) async {
    await _subjectRepository.addSubject(
        subjectModel: subjectModel,
        onSuccess: () {
          clearTextFormField();
          subjectCtrl.getSubject();
          Get.back();
        },
        onError: (error) {});
  }

  RegistrationStatus? parseRegistrationStatus(String? status) {
    switch (status) {
      case "Đã xác nhận":
        return RegistrationStatus.confirmed;
      case "Chờ xác nhận":
        return RegistrationStatus.awaiting;
      case "Từ chối":
        return RegistrationStatus.declined;
      default:
        return null;
    }
  }

  void clearTextFormField(){
    fullNameController.clear();
    classController.clear();
    studentIdController.clear();
    termController.clear();
    creditController.clear();
    registrationController.clear();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    classController.dispose();
    studentIdController.dispose();
    termController.dispose();
    creditController.dispose();
    registrationController.dispose();
    super.onClose();
  }
}
