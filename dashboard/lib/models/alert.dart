import 'package:hive/hive.dart';

part 'alert.g.dart';

@HiveType(typeId: 2)
class Alert {
  @HiveField(0)
  DateTime start;

  @HiveField(1)
  DateTime end;

  @HiveField(2)
  String description;

  Alert(this.start, this.end, this.description);
}
