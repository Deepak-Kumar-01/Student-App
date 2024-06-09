// var data={
//   "SAT": [
//     {
//       8:45-9:45: {Sub Code: KCA 203, Subject: Operating System, Faculty Name: Ms. Abha Shrama}
//     },
//     {
//       9:45-10:45: {Sub Code: KCA 205, Subject: Data Structures &  Analysis of Algorithms, Faculty Name: Ms.Priyanka}
//     },
//     {
//       10:45-11:45: {Sub Code: KCA A01, Subject: null, Faculty Name: null}
//     },
//     {
//       11:45-12:45: {Sub Code: KCA 201, Subject: Theory of Automata & Formal Languages, Faculty Name: Ms.Janeet Kaur}
//     },
//     {
//       12:45-1:45: {Sub Code: null, Subject: null, Faculty Name: null}
//     },
//     {
//       1:45-2:45: {Sub Code: null, Subject: null, Faculty Name: null}
//     },
//     {
//       2:45-3:45: {Sub Code: null, Subject: null, Faculty Name: null}
//     }
//     ]
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class Timetable {
  final String day;
  final String timeSlot;
  final String subCode;
  final String subject;
  final String facultyName;

  Timetable({
    required this.day,
    required this.timeSlot,
    required this.subCode,
    required this.subject,
    required this.facultyName,
  });

  // Convert a Timetable object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'Day': day,
      'Time Slot': timeSlot,
      'Sub Code': subCode,
      'Subject': subject,
      'Faculty Name': facultyName,
    };
  }

  // Create a Timetable object from a Map object
  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      day: json['Day'] ?? '',
      timeSlot: json['Time Slot'] ?? '',
      subCode: json['Sub Code'] ?? '',
      subject: json['Subject'] ?? '',
      facultyName: json['Faculty Name'] ?? '',
    );
  }
//Convert JSON to List of Timetable Objects
  static List<Timetable>  convertToTimetableList(
      Map<String, List<Map<String, Map<String, dynamic>>>> data) {
    List<Timetable> timetableList = [];
    data.forEach((day, slots) {
      for (var slot in slots) {
        slot.forEach((time, details) {
          timetableList.add(Timetable(
            day: day,
            timeSlot: time,
            subCode: details['Sub Code'] ?? '',
            subject: details['Subject'] ?? '',
            facultyName: details['Faculty Name'] ?? '',
          ));
        });
      }
    });
    return timetableList;
  }
  Future<void> uploadTimetable(List<Timetable> timetableList) async {
    final firestore = FirebaseFirestore.instance;
    CollectionReference timetableCollection = firestore.collection('timetable');

    for (Timetable timetable in timetableList) {
      await timetableCollection.add(timetable.toJson());
    }
  }
}