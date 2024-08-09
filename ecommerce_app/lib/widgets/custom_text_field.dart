import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final Icon? suffixIcon;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.maxLines,
      required this.minLines,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),
        TextField(
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            border: OutlineInputBorder(),
            suffixIcon: widget.suffixIcon,
          ),
          style: const TextStyle(),
        ),
      ],
    );
  }
}
