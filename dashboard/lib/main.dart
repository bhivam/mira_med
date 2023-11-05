import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

import 'package:dashboard/services/colors.dart';
import 'package:dashboard/models/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';
import 'models/alert.dart';

Future<List<List<dynamic>>> _loadCsv() async {
  final _rawData = await rootBundle.loadString("assets/infection_48_hours.csv");
  List<List<dynamic>> data =
      const CsvToListConverter(fieldDelimiter: ",", eol: "\n")
          .convert(_rawData);
  data.removeAt(0);
  return data;
}

Alert getAlert(List<List<dynamic>> data) {
  bool foundProblem = false;
  late DateTime start;
  late DateTime end;
  for (int i = 0; i < data.length; i++) {
    List<dynamic> row = data[i];
    String dt = (row[1] as String).replaceFirst(":", "T");
    dt = "2023" + (dt as String).replaceFirst("23T", "T");
    dt = (dt as String).replaceAll("/", "");
    if (!foundProblem && row[5] == 1) {
      foundProblem = true;
      start = DateTime.parse(dt);
    } else if (foundProblem && (row[5] == 0 || i + 1 == data.length)) {
      end = DateTime.parse(dt);
      break;
    }
  }
  return Alert(start, end, "fever or infection");
}

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(AlertAdapter());

  await Hive.openBox<Note>('notes');
  await Hive.openBox<Alert>('alerts');
  await Hive.openBox('patient_info');
  await Hive.openBox('data');

  List<List<dynamic>> data = await _loadCsv();
  Hive.box<Alert>('alerts').clear();
  Hive.box<Alert>('alerts').add(getAlert(data));

  runApp(MyApp(data));
}

class MyApp extends StatelessWidget {
  List<List<dynamic>> data;
  MyApp(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mira Med',
      theme: ThemeData.light(useMaterial3: true),
      home: Dashboard(data),
      color: darkBlue,
    );
  }
}
