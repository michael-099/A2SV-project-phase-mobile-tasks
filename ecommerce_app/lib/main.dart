// import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          body: ProductCard(
        productName: "Derby Leather Shoes",
        price: "200",
        label: "Men's shoe",
        rating: "4.5",
        height: 300,
        width: 420,
      )),
    ),
  );
}
