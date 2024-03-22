import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/presentation/pages/student/student_controller.dart';

import '../../../../data/model/student/student_model.dart';
import '../../../../data/repositories/student_repository.dart';

class AddController extends GetxController{

  RxList<Student> students = <Student>[].obs;

  final StudentRepository _studentRepository = GetIt.I.get<StudentRepository>();

  final studentCtrl = Get.find<StudentController>();


  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController idSVController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController averageController = TextEditingController();

  void clearTextFormField(){
    fullNameController.clear();
    classController.clear();
    idSVController.clear();
    emailController.clear();
    dateOfBirthController.clear();
    addressController.clear();
    phoneController.clear();
    averageController.clear();
  }


  ///
  /// POST API
  ///
  Future<void> addStudent(Student student) async {
    await _studentRepository.addStudent(
      student: student,
      onSuccess: () {
        clearTextFormField();
        studentCtrl.getAllStudents();
        Get.back();
      },
      onError: (_) {},
    );
  }

  List<bool> get isSelected => studentCtrl.isSelected;

  List<String> get registeredCourses {
    final List<String> courses = [];
    for (int i = 0; i < studentCtrl.isSelected.length; i++) {
      if (studentCtrl.isSelected[i]) {
        courses.add(studentCtrl.subjects[i]);
      }
    }
    return courses;
  }

  @override
  void onClose() {
    fullNameController.dispose();
    classController.dispose();
    idSVController.dispose();
    emailController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
    phoneController.dispose();
    averageController.dispose();
    super.onClose();
  }
}