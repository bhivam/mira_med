import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note.dart';
import '../widgets/note_tile.dart';

class Notes extends StatelessWidget {
  String category;
  Notes(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width * 0.8,
        child: ValueListenableBuilder(
          builder: (context, notes, child) => GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            children: notes.values
                .toList()
                .where((note) => note.type == category)
                .map((note) => NoteTile(note))
                .toList(),
          ),
          valueListenable: Hive.box<Note>('notes').listenable(),
        ));
  }
}
