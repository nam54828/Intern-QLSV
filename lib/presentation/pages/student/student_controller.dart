import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/repositories/student_repository.dart';
import 'package:template/data/repositories/subject_repository.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';

import '../../../../data/model/student/student_model.dart';
import '../subject/add/add_subject_controller.dart';

class StudentController extends GetxController {
  RxList<Student> students = <Student>[].obs;

  final StudentRepository _studentRepository = GetIt.I.get<StudentRepository>();

  late final subjectCtrl = Get.find<SubjectController>();

  final selectedButton = 'Students'.obs;

  final subjects = [
    'Lịch sử Đảng',
    'Giải tích 2',
    'Kỹ thuật Lập trình',
    'Đại số tuyến tính',
    'Vật lý đại cương'
  ].obs;
  final isSelected = List<bool>.filled(5, false).obs;

  void updateSelection(int index, bool value) {
    isSelected[index] = value;
  }

  void selectButton(String text) {
    selectedButton.value = text!;
  }

  ///
  /// GET API
  ///
  Future<void> getAllStudents() async {
    await _studentRepository.getStudent(onSuccess: (data) {
      students.assignAll(data);
    }, onError: (dynamic error) {
      print('Error fetching students: $error');
    });
  }

  ///
  /// DELETE API
  ///
  Future<void> deleteStudent(String idStudent) async {
    await _studentRepository.deleteStudent(
      idStudent: idStudent,
      onSuccess: () {
        print('Student deleted successfully');
        getAllStudents();
      },
      onError: (error) {
        print('Error deleting student: $error');
      },
    );
  }

  @override
  void onInit() {
    print("Loading...");
    // TODO: implement onInit
    getAllStudents();
    super.onInit();
  }

}
