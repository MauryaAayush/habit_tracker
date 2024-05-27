import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Themes/Theme_Provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Center(
          child: CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
