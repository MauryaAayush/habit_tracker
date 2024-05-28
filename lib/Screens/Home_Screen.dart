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
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
      ),
    );
  }
}
