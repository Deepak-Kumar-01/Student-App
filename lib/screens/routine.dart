import 'package:flutter/material.dart';
import '../modals/timetableModal.dart';

class Routine extends StatelessWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int dayNumber = now.weekday;
    print("Day number: $dayNumber");

    return Scaffold(
      appBar: AppBar(
        title: Text("Timetable"),
      ),
      body: StreamBuilder<MCA>(
        stream: MCAService().getMCADataStream(),
        builder: (context, AsyncSnapshot<MCA> snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          MCA? mca = snapshot.data;

          if (mca == null || mca.semesters.isEmpty) {
            return Center(child: Text('No timetable data available.'));
          }

          // Ensure dayNumber is within valid range
          if (dayNumber < 1 || dayNumber > 7) {
            return Center(child: Text('Invalid day number.'));
          }

          String dayName = mca.semesters[0].timetable[dayNumber - 1].dname;
          var day = mca.semesters[0].timetable[dayNumber - 1];

          return Column(
            children: [
              Text("Today: $dayName"),
              Expanded(
                child: ListView.builder(
                  itemCount: day.slots.length,
                  itemBuilder: (context, index) {
                    var slot = day.slots[index];

                    return ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            slot.subCode ?? "null",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      title: Text(
                        slot.subject ?? "null",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        slot.faculty ?? "null",
                        style: TextStyle(color: Color(0xFF5E5E5E)),
                      ),
                      trailing: Text(
                        slot.time ?? "null",
                        style: TextStyle(color: Color(0xFF5E5E5E)),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
