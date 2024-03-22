import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/repositories/subject_repository.dart';

import '../../../data/model/subject/subject_model.dart';

class SubjectController extends GetxController {
  RxList<SubjectModel> subjects = <SubjectModel>[].obs;

  final SubjectRepository _subjectRepository = GetIt.I.get<SubjectRepository>();

  final TextEditingController moreSubjectController = TextEditingController();

  Future<void> getSubject() async {
    await _subjectRepository.getSubject(
        onSuccess: (data) {
          subjects.assignAll(data);
        },
        onError: (_) {});
  }

  Future<void> deleteSubject(String idSubject) async {
    await _subjectRepository.deleteSubject(
        idSubject: idSubject,
        onSuccess: () {
          getSubject();
        },
        onError: (_) {});
  }

  @override
  void onInit() {
    getSubject();
    super.onInit();
  }
}
