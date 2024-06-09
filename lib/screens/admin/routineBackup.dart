// void extractTimeTable() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['xlsx'],
//     allowMultiple: false,
//   );
//   if (result != null) {
//     File file = File(result.files.single.path!);
//     var bytes = file.readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);
//     //get subcode mapped to subject
//     print(excel.tables.keys.last);
//     for (var table in excel.tables.keys){
//       var sheet = excel.tables[table];
//       if(sheet!.sheetName=="Faculty"){
//         subFacMap.clear();
//         routine.clear();
//         for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++){
//           for (int colIndex = 0; colIndex < sheet.maxColumns; colIndex++){
//             var cellValue = sheet
//                 .cell(CellIndex.indexByColumnRow(
//                 columnIndex: colIndex, rowIndex: rowIndex))
//                 .value;
//             codeMapping.add(cellValue.toString());
//           }
//           subjCodeDetails.addAll({codeMapping[0]:{"Subject":codeMapping[1],"Faculty":codeMapping[2]}});
//           codeMapping.clear();
//         }
//         // print(subFacMap);
//         print("Faculty Sheet proccessed:$subjCodeDetails");
//         break;
//       }else{
//         continue;
//       }
//     }
//     for (var table in excel.tables.keys) {
//       var sheet = excel.tables[table];
//       if (sheet != null && sheet.sheetName=="Routine") {
//         timeSlot.clear();
//         for (int i = 1; i < sheet.maxColumns; i++) {
//           timeSlot.add(sheet
//               .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
//               .value
//               .toString());
//         }
//         print("Time Slots: ${timeSlot}");
//         for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++){
//           // print("Row Index: ${rowIndex}");
//           periodDetails.clear();
//           for (int colIndex = 1; colIndex < sheet.maxColumns; colIndex++){
//             var cellValue = sheet
//                 .cell(CellIndex.indexByColumnRow(
//                 columnIndex: colIndex, rowIndex: rowIndex))
//                 .value;
//
//             String key=timeSlot[colIndex-1];
//             String? subj=subjCodeDetails[cellValue.toString()]?["Subject"];
//             String? faculty=subjCodeDetails[cellValue.toString()]?["Faculty"];
//             periodDetails.add({key:{"Sub Code": "$cellValue","Subject":"$subj","Faculty Name":"$faculty"}});
//           }
//           // List<Timetable> timetableList=Timetable.convertToTimetableList({days[rowIndex-1]:periodDetails});
//           // final firestore = FirebaseFirestore.instance;
//           // CollectionReference timetableCollection = firestore.collection('timetable');
//           // for (Timetable timetable in timetableList) {
//           //   await timetableCollection.add(timetable.toJson());
//           // }
//           // print(timetableList);
//           routine.add({days[rowIndex-1]:periodDetails});
//           // Timetable().convertToTimetableList(data)
//         }
//         print(routine[5]);
//
//       }
//     }
//   }
// }
//     {
//       SAT: [
//         {8:45-9:45: {Sub Code: KCA 203, Subject: Operating System, Faculty Name: Ms. Abha Shrama}},
//         {9:45-10:45: {Sub Code: KCA 205, Subject: Data Structures &  Analysis of Algorithms, Faculty Name: Ms.Priyanka}},
//         {10:45-11:45: {Sub Code: KCA A01, Subject: null, Faculty Name: null}},
//         {11:45-12:45: {Sub Code: KCA 201, Subject: Theory of Automata & Formal Languages, Faculty Name: Ms.Janeet Kaur}},
//         {12:45-1:45: {Sub Code: null, Subject: null, Faculty Name: null}},
//         {1:45-2:45: {Sub Code: null, Subject: null, Faculty Name: null}},
//         {2:45-3:45: {Sub Code: null, Subject: null, Faculty Name: null}}
//     ]}