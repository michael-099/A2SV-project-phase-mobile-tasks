// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../widgets/product_description.dart';
import '../widgets/product_name_and_price.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            Image.asset("lib/assets/images/image.png"),
            ProductDescription(label: "mens shoe", rating: "4.0"),
            ProductNameAndPrice(productName: "Derby Leather", price: "\$120"),
            CustomNumberPaginator(),
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
    );
  }
}

class CustomNumberPaginator extends StatefulWidget {
  const CustomNumberPaginator({super.key});

  @override
  _CustomNumberPaginatorState createState() => _CustomNumberPaginatorState();
}



class _CustomNumberPaginatorState extends State<CustomNumberPaginator> {
  int _currentPage = 0;
  late NumberPaginatorController _controller;


  @override
  void initState() {
    super.initState();
    _controller = NumberPaginatorController();
  }

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      numberPages: 6,
      controller: _controller,
      onPageChange: (int index) {
        setState(() {
          _currentPage = index;
        });
      },
      config: NumberPaginatorUIConfig(
        buttonSelectedForegroundColor: Colors.white,
        buttonSelectedBackgroundColor: Colors.blue,
        buttonUnselectedForegroundColor: Colors.blue,
        buttonUnselectedBackgroundColor: Colors.white,
        buttonShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.blue),
        ),
        height:
            65, // Making the buttons square by setting equal width and height
        contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
      ),
      showPrevButton: false, // Remove the previous button
      showNextButton: false, // Remove the next button
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
