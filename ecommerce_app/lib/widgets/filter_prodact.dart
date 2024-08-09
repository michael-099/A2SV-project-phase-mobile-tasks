import 'package:flutter/material.dart';

import "custom_text_field.dart";

class FilterProdactWidget extends StatelessWidget {
  FilterProdactWidget({super.key});
  TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 338,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            label: "category",
            maxLines: 1,
            minLines: 1,
            controller: _categoryController,

          ),
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
                )
        ],

      ),
    );
  }
}
