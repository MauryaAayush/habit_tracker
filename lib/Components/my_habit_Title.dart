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
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        title: Text(text),
        leading: Checkbox(value: isCompleted, onChanged: onChanged),

      ),
    );
  }
}
