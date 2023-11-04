/*
Note is some general information that the care provider can enter in.
*/

import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String title; //

  @HiveField(1)
  DateTime start;

  @HiveField(2)
  String description;

  @HiveField(3)
  String type;

  Note(this.title, this.start, this.type, this.description);
}
