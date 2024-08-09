import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String label;
  CustomTextField({super.key, required this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("input"),
          ),
          TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder()),
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
