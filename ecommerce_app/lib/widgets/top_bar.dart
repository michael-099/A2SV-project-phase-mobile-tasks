import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(),
              Column(
                children: [
                  Text("time-time-time"),
                  Text("name name "),
                ],
              ),
            ],
          ),
          Icon(Icons.notification_add_outlined),
        ],
      ),
    );
  }
}
