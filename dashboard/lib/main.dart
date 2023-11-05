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
  return const CsvToListConverter(fieldDelimiter: ",", eol: "\n")
      .convert(_rawData);
}

Alert getAlert(List<List<dynamic>> data) {
  bool foundProblem = false;
  late DateTime start;
  late DateTime end;
  for (int i = 0; i < data.length; i++) {
    List<dynamic> row = data[i];
    row[0] = (row[0] as String).replaceFirst(":", "T");
    row[0] = "2023" + (row[0] as String).replaceFirst("23T", "T");
    row[0] = (row[0] as String).replaceAll("/", "");
    if (!foundProblem && row[4] == 1) {
      foundProblem = true;
      start = DateTime.parse(row[0] as String);
    } else if (foundProblem && (row[4] == 0 || )) {
      end = DateTime.parse(row[0] as String);
      break;
    }
  }



  return Alert(start, end, "fever");
}

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(AlertAdapter());

  await Hive.openBox<Note>('notes');
  await Hive.openBox<Alert>('alerts');
  await Hive.openBox('patient_info');

  List<List<dynamic>> data = await _loadCsv();
  Hive.box<Alert>('alerts').clear();
  Hive.box<Alert>('alerts').add(getAlert(data));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mira Med',
      theme: ThemeData.light(useMaterial3: true),
      home: const Dashboard(),
      color: darkBlue,
    );
  }
}
