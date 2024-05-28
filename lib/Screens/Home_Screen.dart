import 'package:flutter/material.dart';
import 'package:habit_tracker/Components/My_Drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
    );
  }
}
