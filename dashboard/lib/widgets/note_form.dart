import 'package:dashboard/services/colors.dart';
import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/note.dart';

class NoteForm extends StatelessWidget {
  String noteCategory;
  NoteForm(this.noteCategory, {super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          height: context.height * 0.6,
          width: context.height * 0.575,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("Add a note",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                  fillColor: Colors.white54,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                minLines: 10,
                maxLines: 10,
                maxLength: 500,
                decoration: const InputDecoration(
                  hintText: "Description",
                  fillColor: Colors.white54,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Hive.box<Note>('notes').add(Note(
                          titleController.text,
                          DateTime.now(),
                          noteCategory,
                          descriptionController.text));
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 75,
                      child: Center(
                          child: Text("Add Note",
                              style: Theme.of(context).textTheme.bodyLarge)),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
