import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/model/subject/subject_model.dart';
import 'package:template/data/repositories/subject_repository.dart';
import 'package:template/presentation/pages/student/add/add_controller.dart';
import 'package:template/presentation/pages/student/student_controller.dart';
import 'package:template/presentation/pages/subject/add/add_subject_controller.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';

class UpdateSubjectController extends GetxController{
  late SubjectModel subjectModel;

  RxList<String> selectMoreSubject = <String>[].obs;

  final SubjectRepository _subjectRepository = GetIt.I.get<SubjectRepository>();

  final subjectCtrl = Get.find<SubjectController>();

  final addSubjectCtrl = Get.find<AddSubjectController>();

  final addStudentCtrl = Get.find<AddController>();

  final studentCtrl = Get.find<StudentController>();

  final formkey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController termController = TextEditingController();
  final TextEditingController creditController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();

  Future<void> updateSubject(SubjectModel subjectModel1) async{
    await _subjectRepository.updateSubject(
        subjectModel: subjectModel1,
        idSubject: subjectModel.id ?? '',
        onSuccess: (){
          subjectCtrl.getSubject();
          Get.back();
        },
        onError: (_){});
  }

  @override
  void onInit() {
    subjectModel = Get.arguments as SubjectModel;
    selectMoreSubject.assignAll(subjectModel.registeredCourses ?? {''});
    fullNameController.text = subjectModel.fullName ?? '';
    classController.text = subjectModel.subjectClass ?? '';
    studentIdController.text = subjectModel.studentId ?? '';
    termController.text = subjectModel.semester ?? '';
    creditController.text = subjectModel.creditHours.toString();
    registrationController.text = subjectModel.registrationStatusToString(subjectModel.registrationStatus);
    super.onInit();
  }

}