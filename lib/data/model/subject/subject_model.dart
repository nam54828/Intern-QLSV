class SubjectModel {
  String? id;
  RegistrationStatus? registrationStatus;
  int? creditHours;
  String? semester;
  List<String>? registeredCourses;
  String? subjectClass;
  String? fullName;
  String? studentId;

  SubjectModel({
    this.id,
    this.registrationStatus,
    this.creditHours,
    this.semester,
    this.registeredCourses,
    this.subjectClass,
    this.fullName,
    this.studentId,
  });

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    registrationStatus = _parseRegistrationStatus(json['registrationStatus']);
    creditHours = json['creditHours'];
    semester = json['semester'];
    registeredCourses = List<String>.from(json['registeredCourses']);
    subjectClass = json['class'];
    fullName = json['fullName'];
    studentId = json['studentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['_id'] = id;
    data['registrationStatus'] = registrationStatusToString(registrationStatus);
    data['creditHours'] = creditHours;
    data['semester'] = semester;
    data['registeredCourses'] = registeredCourses;
    data['class'] = subjectClass;
    data['fullName'] = fullName;
    data['studentId'] = studentId;
    return data;
  }

  RegistrationStatus _parseRegistrationStatus(String? status) {
    switch (status) {
      case 'confirmed':
        return RegistrationStatus.confirmed;
      case 'awaiting':
        return RegistrationStatus.awaiting;
      case 'declined':
        return RegistrationStatus.declined;
      default:
        return RegistrationStatus.declined;
    }
  }

  String registrationStatusToString(RegistrationStatus? status) {
    switch (status) {
      case RegistrationStatus.confirmed:
        return 'CONFIRMED';
      case RegistrationStatus.awaiting:
        return 'AWAITING';
      case RegistrationStatus.declined:
        return 'DECLINED';
      default:
        return 'DECLINED';
    }
  }
}

enum RegistrationStatus {
  confirmed,
  awaiting,
  declined
}
