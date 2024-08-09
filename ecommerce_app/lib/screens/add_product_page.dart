import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text("Search Product"),
        ),
        body: const Form(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CustomTextField(),
              CustomTextField(),
              CustomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
