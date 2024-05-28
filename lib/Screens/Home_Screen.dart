import 'package:flutter/material.dart';
import 'package:habit_tracker/Components/My_Drawer.dart';

final TextEditingController textEditingController = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          actions: [],
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
