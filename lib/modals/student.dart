class Student{
  String name;
  DateTime dob;
  // String universityRoll;
  // String admissionNo;
  // String universityEmailId;
  // String personalEmail;
  // String currentSemester;
  // bool isVerified;
  // Map<String,Object?> subjects;
  Student({required this.name,required this.dob});

  //Factory Constructor
  Student.fromJson(Map<String,Object?> json):this(
    name:json['name']! as String,
    dob: json['dob']! as DateTime,
  );

  Student copyWith({
    String? name,
    DateTime? dob,
}){
    return Student(name: name?? this.name,dob: dob ?? this.dob);
  }
  Map<String, Object?> toJson() {
    return {
      'name':name,
      'dob':dob,
    };
  }
}

