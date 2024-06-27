import 'package:cloud_firestore/cloud_firestore.dart';

class MCAService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<MCA> getMCADataStream() {
    try {
      return _db
          .collection('degrees')
          .doc('btec')
          .collection('semesters')
          .doc('semester_4')
          .collection('timetable')
          .snapshots()
          .map((snapshot) => _mcaFromSnapshot(snapshot));
    } catch (e) {
      print('Error fetching MCA data: $e');
      throw e;
    }
  }
  MCA _mcaFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    //here snapshot is day_0/day_1..../day_5
    // print("Snap:${snapshot.docs.first.data()}");
    List<Day> timetable = [];

    snapshot.docs.forEach((doc) {
      // print("DAY:${doc.data()['day']}");
      var day = Day(
        day: doc.id, // Assuming document id is 'day_0', 'day_1', ..., 'day_5'
        dname: doc.data()['day'],
        slots: _slotsFromSnapshot(doc['slots']),
      );
      timetable.add(day);
    });

    // Assuming 'First Semester' is the name you want to assign
    var semester = Semester(name: 'First Semester', timetable: timetable);

    return MCA(semesters: [semester]);
  }

  List<Slot> _slotsFromSnapshot(List<dynamic> slotsSnapshot) {
    List<Slot> slots = [];

    slotsSnapshot.forEach((slotJson) {

      var slot = Slot(
        faculty: slotJson['faculty']??'',
        subject: slotJson['subject'] ?? '', // Provide a default value if 'subject' is null
        subCode: slotJson['subCode']??'',
        time: slotJson['time'] ?? '', // Provide a default value if 'time' is null

      );
      slots.add(slot);
    });

    return slots;
  }
}

class MCA {
  final List<Semester> semesters;

  MCA({required this.semesters});
}

class Semester {
  final String name;
  final List<Day> timetable;

  Semester({required this.name, required this.timetable});
}

class Day {
  final String day;
  final String dname;
  final List<Slot> slots;

  Day({required this.day,required this.dname, required this.slots});
}

class Slot {
  final String faculty;
  final String subCode;
  final String subject;
  final String time;

  Slot({required this.faculty,required this.subCode, required this.subject, required this.time});
}
