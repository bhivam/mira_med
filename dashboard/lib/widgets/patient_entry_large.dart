import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class PatientEntryLarge extends StatefulWidget {
  bool editHist;
  String attribute;
  String entryTitle;
  PatientEntryLarge(this.editHist, this.attribute, this.entryTitle, {super.key});

  @override
  State<PatientEntryLarge> createState() => _PatientEntryLargeState();
}

class _PatientEntryLargeState extends State<PatientEntryLarge> {
  @override
  Widget build(BuildContext context) {

    TextEditingController titleController = TextEditingController();

    titleController.text = Hive.box("patient_info").get(widget.attribute, defaultValue:"");

    return Container(
        // create box called history, use hive to store the data from the history box
        // maybe create a patient history object and store it all in hive
        // simplest way - key value pairs
        child: Container (
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          width: context.height * .7,
          child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10), 
                  Text(widget.entryTitle,
                  style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold,
                  color: Colors.white,)), 
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: widget.editHist,
                    onChanged: (_) { Hive.box("patient_info").put(widget.attribute, titleController.text); },
                    controller: titleController,
                    minLines: 5,
                    maxLines: 10,
                    maxLength: 500,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      )
                    )
                  ),
                  //SizedBox(height: 10),
                  /*
                  TextFormField(
                    readOnly: widget.editHist,
                    controller: formController,
                    minLines: 10,
                    maxLines: 10,
                    maxLength: 500,
                    decoration: const InputDecoration (
                      hintText: "Description",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      )
                    )
                  )
                */
                ],
              ),
            ),
    );
  }
}