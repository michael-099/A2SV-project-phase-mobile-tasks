import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "time-time-time",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      // backgroundColor: Colors.amber,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black38),
                  ),
                  Row(
                    children: [
                      Text(
                        "Hello, ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          // backgroundColor: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black38),
                      ),
                      Text(
                        "Michael",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.notifications_active_outlined,
          ),
        ],
      ),
    );
  }
}
