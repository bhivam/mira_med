import 'package:dashboard/pages/alerts.dart';
import 'package:dashboard/pages/chat.dart';
import 'package:dashboard/pages/history.dart';
import 'package:dashboard/pages/home.dart';
import 'package:dashboard/pages/notes.dart';
import 'package:dashboard/pages/vitals.dart';
import 'package:dashboard/services/colors.dart';
import 'package:dashboard/services/media_query.dart';
import 'package:dashboard/widgets/note_form.dart';
import 'package:dashboard/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/note.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String currentPage = "Home";
  List<String> noteCategories = [
    "Emotional and Mental Health",
    "Therapy and Exercises",
    "Nutrition and Hydration",
    "Mobility and Motor Skills",
    "Other"
  ];
  var details = {
    "Home": const Home(),
    "Vitals": const Vitals(),
    "Notes": Notes("Notes"),
    "Emotional and Mental Health": Notes("Emotional and Mental Health"),
    "Therapy and Exercises": Notes("Therapy and Exercises"),
    "Nutrition and Hydration": Notes("Nutrition and Hydration"),
    "Mobility and Motor Skills": Notes("Mobility and Motor Skills"),
    "Other": Notes("Other"),
    "Alerts": const Alerts(),
    "MiraBot": const Chat(),
    "Patient Information": const History(),
  };
  Box<Note> notes = Hive.box<Note>('notes');

  void setPage(String pageName) {
    setState(() => currentPage = pageName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(setPage, currentPage),
          Container(
              width: context.width * 0.8,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 0.2 * context.width),
                    width: context.width * 0.8,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0.1,
                        0.9,
                      ],
                      colors: [lightPurple, darkPurple],
                    )),
                  ),
                  details[currentPage] as Widget
                ],
              )),
        ],
      ),
      floatingActionButton: noteCategories.contains(currentPage)
          ? Container(
              height: 75,
              width: 75,
              child: FittedBox(
                child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                          builder: (BuildContext context) {
                            return NoteForm(currentPage);
                          },
                          context: context);
                    },
                    child: const Icon(Icons.note_add, size: 50)),
              ),
            )
          : null,
    );
  }
}
