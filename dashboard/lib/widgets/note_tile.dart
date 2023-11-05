import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/colors.dart';
import '../models/note.dart';

class NoteTile extends StatelessWidget {
  Note note;
  double width;
  NoteTile(this.note, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        child: Container(
          width: width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(note.title,
                        style: Theme.of(context).textTheme.headlineMedium),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                    "${DateFormat.yMMMd().format(note.start)} ${DateFormat.jm().format(note.start)}"),
                const SizedBox(
                  height: 20,
                ),
                Text(note.description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
