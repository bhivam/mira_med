// ignore_for_file: prefer_const_constructors

import 'package:dashboard/services/colors.dart';
import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HistoryForm extends StatelessWidget {
    String formCategory;
    HistoryForm(this.formCategory, {super.key});

    TextEditingController titleController = TextEditingController();
    TextEditingController formController = TextEditingController();

    @override
    Widget build(BuildContext context)  {
      return Dialog(
        backgroundColor: Colors.white,
        child: Container (
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          height: context.height * .6,
          width: context.height * .575,
          child: Column (
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
                        )
                      )
                    )
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: formController,
                    minLines: 10,
                    maxLines: 10,
                    maxLength: 500,
                    decoration: const InputDecoration (
                      hintText: "Description",
                      fillColor: Colors.white54,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      )
                    )
                  )
                ],
              ),
            ),
          );
    }
}