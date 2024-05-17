import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Map<String, String> keyValueStore = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(Icons.upload),
              onTap: selectExcelFile,
            ),
          ],
        ),
      ),
    );
  }

  void selectExcelFile() async {
    keyValueStore["name"]="deepak";
    print("Clicked");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    if (result != null) {
      print("RESULT NOT NULL");
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      //Assuming there is only one Sheet in excel
      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table]?.maxColumns);
        print(excel.tables[table]?.maxRows);
        for (var row in excel.tables[table]!.rows) {
          for (var cell in row) {
            print('cell ${cell?.rowIndex}/${cell?.columnIndex}');
            final value = cell?.value;
            final numFormat =
                cell?.cellStyle?.numberFormat ?? NumFormat.standard_0;
            switch (value) {
              case null:
                print('  empty cell');
                print('  format: ${numFormat}');
              case TextCellValue():
                print('  text: ${value.value}');
              case FormulaCellValue():
                print('  formula: ${value.formula}');
                print('  format: ${numFormat}');
              case IntCellValue():
                print('  int: ${value.value}');
                print('  format: ${numFormat}');
              case BoolCellValue():
                print('  bool: ${value.value ? 'YES!!' : 'NO..'}');
                print('  format: ${numFormat}');
              case DoubleCellValue():
                print('  double: ${value.value}');
                print('  format: ${numFormat}');
              case DateCellValue():
                print(
                    '  date: ${value.year} ${value.month} ${value.day} (${value.asDateTimeLocal()})');
              case TimeCellValue():
                print(
                    '  time: ${value.hour} ${value.minute} ... (${value.asDuration()})');
              case DateTimeCellValue():
                print(
                    '  date with time: ${value.year} ${value.month} ${value.day} ${value.hour} ... (${value.asDateTimeLocal()})');
            }
          }
        }
      }
    }
    print(keyValueStore);
  }
}
