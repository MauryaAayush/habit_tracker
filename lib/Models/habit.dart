import 'package:isar/isar.dart';

// command for generate the file: dart run build_runner build     
part 'habit.g.dart';

@Collection()
class Habit {
// habit id
  Id id = Isar.autoIncrement;

// habit name
  late String name;

// complete days
  List<DateTime> completeddays = [
  //   dateTime(years, months, day),
  //   dateTime(years, months, day),
  //   dateTime(years, months, day),
  ];

}