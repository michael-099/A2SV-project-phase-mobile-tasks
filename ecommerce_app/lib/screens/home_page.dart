import 'package:flutter/material.dart';


import '../widgets/product_card.dart';
import '../widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopBar(),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Avilable Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(221, 59, 55, 55),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ProductCard(
                  productName: "Derby Leather Shoes",
                  price: "\$200",
                  label: "Men's shoe",
                  rating: "4.5",
                 
                ),
                ProductCard(
                  productName: "Derby Leather Shoes",
                  price: "\$200",
                  label: "Men's shoe",
                  rating: "4.5",
                 
                ),
                ProductCard(
                  productName: "Derby Leather Shoes",
                  price: "\$200",
                  label: "Men's shoe",
                  rating: "4.5",
                  
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 0, 125, 227),
          child: const Text(
            "+",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
