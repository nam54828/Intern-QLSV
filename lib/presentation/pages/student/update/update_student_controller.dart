import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/data/repositories/student_repository.dart';
import 'package:template/presentation/pages/student/add/add_controller.dart';
import 'package:template/presentation/pages/student/student_controller.dart';

class UpdateStudentController extends GetxController{
  late  Student studentModel ;

  final StudentRepository _studentRepository = GetIt.I.get<StudentRepository>();

  final studentCtrl = Get.find<StudentController>();
  final addStudentCtrl = Get.find<AddController>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController idSVController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController averageController = TextEditingController();


  Future<void> updateStudent(Student student)async {
    await _studentRepository.updateStudent(
        student: student,
        idStudent: studentModel.id ?? '',
        onSuccess: (){
          studentCtrl.getAllStudents();
          Get.back();
        },
        onError: (_){});
  }

   @override
   void onInit() {
     studentModel = Get.arguments as Student;
     fullNameController.text = studentModel.fullName;
     classController.text = studentModel.classField;
     emailController.text = studentModel.contactInfo.email;
     dateOfBirthController.text = studentModel.dateOfBirth.toString();
     addressController.text = studentModel.contactInfo.address;
     phoneController.text = studentModel.contactInfo.phoneNumber;
     averageController.text = studentModel.averageScore.toString();
     super.onInit();
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