import 'package:flutter/material.dart';

import "custom_text_field.dart";

class FilterProdactWidget extends StatelessWidget {
  FilterProdactWidget({super.key});
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              label: "category",
              maxLines: 1,
              minLines: 1,
              controller: _categoryController,
              width: double.infinity,
            ),
            const Slider(),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text("Apply"),
                style: FilledButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  const Slider({super.key});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  RangeValues _currentRangeValues = const RangeValues(10, 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "price",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 1000,
          divisions: 100,
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          onChanged: (RangeValues values) {
            setState(
              () {
                _currentRangeValues = values;
              },
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
