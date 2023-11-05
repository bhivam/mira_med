import 'package:dashboard/services/colors.dart';
import 'package:dashboard/models/note.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dashboard.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');

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
