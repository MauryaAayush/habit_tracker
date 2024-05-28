import 'package:flutter/material.dart';
import 'package:habit_tracker/Components/My_Drawer.dart';
import 'package:habit_tracker/DataBase/habit_database.dart';
import 'package:provider/provider.dart';

final TextEditingController textEditingController = TextEditingController();

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState()
  {
  // read  existing habits on app startup

    Provider.of<HabitDataBase>(context,listen: false).readHabits();
    super.initState();
  }



  // create  new habit
  @override
  Widget build(BuildContext context) {

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
    );
  }
}
