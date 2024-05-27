import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Home_Screen.dart';
import 'Themes/Theme_Provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme:  Provider.of<ThemeProvider>(context).themeData,
    );
  }
}


