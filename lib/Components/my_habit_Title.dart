import 'package:flutter/material.dart';

class MyHabitTitle extends StatelessWidget {
  final bool isCompleted;

  const MyHabitTitle({
    super.key,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green
            : Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
