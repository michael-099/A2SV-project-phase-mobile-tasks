import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/top_bar.dart';

class SearchProductPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text("Search Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
      
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
      ),
    );
  }
}
