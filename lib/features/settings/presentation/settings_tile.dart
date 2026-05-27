import 'package:flutter/material.dart';

class MySettingsTile extends StatelessWidget {
  final String title;
  final Widget action;

  const MySettingsTile({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left:25, right: 25, top: 10),
      child: Row(
        children: [
          Text(title),
          action,
        ]
      )
    );
  }
} 