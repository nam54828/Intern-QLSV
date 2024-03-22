import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/data/repositories/student_repository.dart';
import 'package:template/presentation/pages/subject/subject_controller.dart';

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
    selectedButton.value = text;
  }

  ///
  /// GET API
  ///
  Future<void> getAllStudents() async {
    await _studentRepository.getStudent(
        onSuccess: (data) {
          students.assignAll(data);
        },
        onError: (_) {});
  }

  ///
  /// DELETE API
  ///
  Future<void> deleteStudent(String idStudent) async {
    await _studentRepository.deleteStudent(
      idStudent: idStudent,
      onSuccess: () {
        getAllStudents();
      },
      onError: (_) {},
    );
  }

  @override
  void onInit() {
    getAllStudents();
    super.onInit();
  }
}
