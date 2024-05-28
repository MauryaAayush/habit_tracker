import 'package:flutter/material.dart';

class MyHabitTitle extends StatelessWidget {
  final bool isCompleted;
  final String text;
  const MyHabitTitle({
    super.key,
    required this.text,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green
            : Theme.of(context).colorScheme.secondary,
      ),
      child: Text(text),
    );
  }
}
