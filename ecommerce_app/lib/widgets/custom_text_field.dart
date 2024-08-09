import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final Icon? suffixIcon;
  double width;

  CustomTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.maxLines,
      required this.minLines,
      this.suffixIcon,
      this.width = double.infinity});

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
        SizedBox(
          width: widget.width,
          // height: 40,
          child: TextField(
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(160.0)),
              ),
            ),
            style: const TextStyle(),
          ),
        ),
      ],
    );
  }
}
