import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class ExcelHandler {
  List<Map<String, dynamic>> setAuthForStudent = [];
  Map<String, dynamic> rowMap = {};
  List<String> headers = [];

  void extractUserAuthDetail() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    if (result != null) {
      setAuthForStudent.clear();
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      var deptName=excel.tables.keys.first;
      print("Department:${deptName}");
      for (var row in excel.tables[deptName]!.rows) {
        for(var cell in row){
          String? mca=cell?.value.toString();
          // print(mca);
          if(mca=="Roll No"){
            print("output");
            print(cell?.value);
          }
        }
        // print("SHEET NAME:${sheet?.sheetName}"); //sheet Name

        // for (var row in excel.tables[table]!.rows) {
        //   for (var cell in row) {
        //     print('cell ${cell?.rowIndex}/${cell?.columnIndex}');
        //     final value = cell?.value;
        //     final numFormat =
        //         cell?.cellStyle?.numberFormat ?? NumFormat.standard_0;
        //     switch (value) {
        //       case null:
        //         print('  empty cell');
        //         print('  format: ${numFormat}');
        //       case TextCellValue():
        //         print('  text: ${value.value}');
        //       case FormulaCellValue():
        //         print('  formula: ${value.formula}');
        //         print('  format: ${numFormat}');
        //       case IntCellValue():
        //         print('  int: ${value.value}');
        //         print('  format: ${numFormat}');
        //       case BoolCellValue():
        //         print('  bool: ${value.value ? 'YES!!' : 'NO..'}');
        //         print('  format: ${numFormat}');
        //       case DoubleCellValue():
        //         print('  double: ${value.value}');
        //         print('  format: ${numFormat}');
        //       case DateCellValue():
        //         print(
        //             '  date: ${value.year} ${value.month} ${value.day} (${value.asDateTimeLocal()})');
        //       case TimeCellValue():
        //         print(
        //             '  time: ${value.hour} ${value.minute} ... (${value.asDuration()})');
        //       case DateTimeCellValue():
        //         print(
        //             '  date with time: ${value.year} ${value.month} ${value.day} ${value.hour} ... (${value.asDateTimeLocal()})');
        //     }
        //
        //     print('$row');
        //   }
        // }
      }
    }
  }
}
