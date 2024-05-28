import 'package:flutter/material.dart';
import 'package:habit_tracker/Models/app_setting.dart';
import 'package:habit_tracker/Models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDataBase extends ChangeNotifier {
  static late Isar isar;

  /*
  setup
   */

// initialization

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HabitSchema, AppSettingsSchema],
      directory: dir.path,
    );
  }

// save first date of app startup (for heatmap)

  Future<void> saveFirstLaunchDate()
  async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if(existingSettings == null)
      {
        final settings  = AppSettings()..firstLaunchDate = DateTime.now();
        await isar.writeTxn(() => )
      }
  }
// get first date of app startup (for heatmap)

/*
crud operations
 */

// List of habits

// Craet -> add a new habit

// Read -> read saved habits from database

// Update -> check habits on and off

// Update -> edit habit name
}
