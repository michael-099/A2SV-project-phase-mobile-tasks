import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.maxLines,
      required this.minLines});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.label),
          ),
          TextField(
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder()),
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}
