import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/patient_entry.dart';
import '../widgets/patient_entry_large.dart';

class History extends StatefulWidget {
  bool editHist;
  History(this.editHist, {super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // create box called history, use hive to store the data from the history box
      // maybe create a patient history object and store it all in hive
      // simplest way - key value pairs
      child: Container(
        width: 0.8 * context.width,
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    PatientEntry(widget.editHist, 'patient_name', 'Name'),
                    PatientEntryLarge(
                        widget.editHist, 'patient_meds', 'Medications'),
                    PatientEntryLarge(
                        widget.editHist, 'patient_allergies', 'Allergies'),
                  ],
                ),
                Column(
                  children: [
                    PatientEntry(widget.editHist, 'patient_age', 'Age'),
                    PatientEntryLarge(
                        widget.editHist, 'patient_surgeries', 'Surgeries'),
                    PatientEntryLarge(
                        widget.editHist, 'patient_soc', 'Social History'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
