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
                ProductCard(
                  productName: "Derby Leather Shoes",
                  price: "\$200",
                  label: "Men's shoe",
                  rating: "4.5",
                  height: 300,
                  width: 420,
                ),
                ProductCard(
                  productName: "Derby Leather Shoes",
                  price: "\$200",
                  label: "Men's shoe",
                  rating: "4.5",
                  height: 300,
                  width: 420,
                ),
                ProductCard(
                  productName: "Derby Leather Shoes",
                  price: "\$200",
                  label: "Men's shoe",
                  rating: "4.5",
                  height: 300,
                  width: 420,
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
