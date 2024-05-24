import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String name;
  String dob;
  String universityRoll;
  String admissionNo;
  String universityEmailId;
  String personalEmail;
  String currentSemester = "1";
  bool isVerified = false;
  String createdBy;
  String role = "student";
  Timestamp createdOn;
  // Map<String,Object?> subjects;
  AppUser(
      {required this.name,
      required this.dob,
      required this.universityRoll,
      required this.admissionNo,
      required this.universityEmailId,
      required this.personalEmail,
      required this.currentSemester,
      required this.isVerified,
      required this.createdBy,
      required this.role,
      required this.createdOn});

  //Factory Constructor
  AppUser.fromJson(Map<String, Object?> json)
      : this(
            name: json['name']! as String,
            dob: json['dob']! as String,
            universityRoll: json['universityRoll'] as String,
            admissionNo: json['admissionNo'] as String,
            universityEmailId: json['universityEmailId'] as String,
            personalEmail: json['personalEmail'] as String,
            currentSemester: json['currentSemester'] as String,
            isVerified: json['isVerified'] as bool,
            createdBy: json['createdBy'] as String,
            role: json['role'] as String,
            createdOn: json['createdOn'] as Timestamp);

  AppUser copyWith({
    String? name,
    String? dob,
    String? universityRoll,
    String? admissionNo,
    String? universityEmailId,
    String? personalEmail,
    String currentSemester = "1",
    bool isVerified = false,
    String? createdBy,
    String? role="student",
    Timestamp? createdOn,
  }) {
    return AppUser(
        name: name ?? this.name,
        dob: dob ?? this.dob,
        universityRoll: universityRoll ?? this.universityRoll,
        admissionNo: admissionNo ?? this.admissionNo,
        universityEmailId: universityEmailId ?? this.universityEmailId,
        personalEmail: personalEmail ?? this.personalEmail,
        currentSemester: currentSemester,
        isVerified: isVerified,
        createdBy: createdBy ?? this.createdBy,
        role:role??this.role,
        createdOn: createdOn ?? this.createdOn);
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'dob': dob,
      'universityRoll': universityRoll,
      'admissionNo': admissionNo,
      'universityEmailId': universityEmailId,
      'personalEmail': personalEmail,
      'currentSemester': currentSemester,
      'isVerified': isVerified,
      'createdBy': createdBy,
      'role':role,
      'createdOn': createdOn
    };
  }
}
