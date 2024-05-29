import 'package:flutter/material.dart';

class MyHabitTitle extends StatelessWidget {
  final bool isCompleted;
  final String text;
  final void Function(bool?)? onChanged;

  const MyHabitTitle({
    super.key,
    required this.text,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          // toggle completion status
          onChanged!(!isCompleted);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Text(text),
          leading: Checkbox(
            activeColor: Colors.green,
            value: isCompleted,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
