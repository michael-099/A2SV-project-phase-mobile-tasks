import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/upload_file.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Align(
              alignment: Alignment.center,
              child: Text(
                "Add product",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const UploadFile(),
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      label: "Name",
                      controller: _nameController,
                      maxLines: 1,
                      minLines: 1,
                    ),
                    CustomTextField(
                      label: "Category",
                      controller: _categoryController,
                      maxLines: 1,
                      minLines: 1,
                    ),
                    CustomTextField(
                      label: "price",
                      controller: _priceController,
                      maxLines: 1,
                      minLines: 1,
                      suffixIcon: const Icon(Icons.attach_money_outlined,color: Colors.black45,),
                    ),
                    CustomTextField(
                      label: "Description",
                      controller: _descriptionController,
                      maxLines: 5,
                      minLines: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text("Add"),
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
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Delete"),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
