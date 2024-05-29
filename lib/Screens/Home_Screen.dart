import 'package:flutter/material.dart';
import 'package:habit_tracker/Components/My_Drawer.dart';
import 'package:habit_tracker/Components/my_habit_Title.dart';
import 'package:habit_tracker/DataBase/habit_database.dart';
import 'package:habit_tracker/Models/habit.dart';
import 'package:provider/provider.dart';

import '../Utils/habit_utils.dart';

final TextEditingController textEditingController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // read  existing habits on app startup
    Provider.of<HabitDataBase>(context, listen: false).readHabits();
    super.initState();
  }

  // create  new habit
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            hintText: "Create a new habit",
          ),
        ),
        actions: [
          //   save Button
          MaterialButton(
            onPressed: () {
              //   get the new habit name
              String newHabitName = textEditingController.text;
              //   Save to database
              context.read<HabitDataBase>().addhabit(newHabitName);
              //   pop box
              Navigator.pop(context);
              //   clear controller
              textEditingController.clear();
            },
            child: const Text('Save'),
          ),

          //   Cancel Button
          MaterialButton(
            onPressed: () {
              //   pop box
              Navigator.pop(context);
              //   clear controller
              textEditingController.clear();
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }

  // check habit on & off
  void checkHabitOnOff(bool? value, Habit habit) {
  //   update habit completion status
  if(value != null)
    {
      context.read<HabitDataBase>().updateHabitCompletion(habit.id, value);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: createNewHabit,
        elevation: 0,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: _buildHabitList(),
    );
  }

  Widget _buildHabitList() {
    final habitDataBase = context.watch<HabitDataBase>();

    // current habits
    List<Habit> currrentHabits = habitDataBase.currentHabits;

    return ListView.builder(
      itemCount: currrentHabits.length,
      itemBuilder: (context, index) {
        // get each individual habit
        final habit = currrentHabits[index];

        // check if the habit is completed
        bool isCompletedToday = isHabitCompletedToday(habit.completeddays);

        // return habit tile UI
        return MyHabitTitle(
          text: habit.name,
          isCompleted: isCompletedToday,
          onChanged: (value) => checkHabitOnOff(value,habit),

        );
      },
    );
  }
}
