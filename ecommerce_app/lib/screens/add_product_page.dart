import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../widgets/custom_text_field.dart';

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
          title: const Text("Search Product"),
        ),
        body: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomTextField(label: "Name",controller:_nameController ,maxLines: 1,minLines: 1,),
              CustomTextField(label: "Category",controller:_categoryController ,maxLines: 1,minLines: 1,),
              CustomTextField(label: "price",controller:_priceController ,maxLines: 1,minLines: 1,),
              CustomTextField(label: "Description",controller:_descriptionController ,maxLines: 5,minLines: 1,),

            ],
          ),
        ),
      ),
    );
  }
}
