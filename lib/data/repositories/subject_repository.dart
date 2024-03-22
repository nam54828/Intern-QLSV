import 'package:template/data/export/data_export.dart';
import 'package:template/domain/end_points/end_point.dart';

import '../../core/di_container.dart';
import '../model/subject/subject_model.dart';

class SubjectRepository {
  final _dio = sl.get<DioClient>();

  ///
  /// Get API SUBJECT
  ///
  Future<void> getSubject(
      {required Function(List<SubjectModel> settings) onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      final response = await _dio.get(EndPoint.SUBJECT);

      final results = response.data as List<dynamic>;
      onSuccess(results
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  ///
  /// POST API SUBJECT
  ///
  Future<void> addSubject(
      {required SubjectModel subjectModel,
      required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      await _dio.post(EndPoint.SUBJECT, data: subjectModel.toJson());
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  ///
  /// DELETE API SUBJECT
  ///
  Future<void> deleteSubject(
      {required String idSubject,
      required Function() onSuccess,
      required Function(dynamic errror) onError}) async {
    try {
      await _dio.delete('${EndPoint.SUBJECT}/$idSubject');
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  ///
  /// PUT API SUBJECT
  ///
  Future<void> updateSubject(
      {required SubjectModel subjectModel,
      required String idSubject,
      required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      await _dio.put('${EndPoint.SUBJECT}/$idSubject',
          data: subjectModel.toJson());
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }
}
