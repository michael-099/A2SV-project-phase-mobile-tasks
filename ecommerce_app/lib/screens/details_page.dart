// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';



import '../widgets/product_description.dart';
import '../widgets/product_name_and_price.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset("lib/assets/images/image.png"),
            
            ProductDescription(label: "mens shoe", rating: "4.0"),
            ProductNameAndPrice(productName: "Derby Leather", price: "\$120"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                  width: 150,
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
                SizedBox(
                  height: 40,
                  width: 150,
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
            )
          ],
        ),
      ),
    );
  }
}
