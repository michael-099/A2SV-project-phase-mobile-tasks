import "package:flutter/material.dart";

import "product_description.dart";
import "product_name_and_price.dart";

class ProductCard extends StatelessWidget {
  String productName;
  String price;
  String label;
  String rating;
  // double width;
  // double height;

  ProductCard(
      {required this.productName,
      required this.price,
      required this.label,
      required this.rating,
      // required this.width,
      // required this.height
      });
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        // elevation: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Image.asset(
                "lib/assets/images/image.png",
                // "lib/assets/images/bag.jpg",
                fit: BoxFit.cover,
                height: 160,
                width: 366,
              ),
            ),
            ProductNameAndPrice(productName: productName, price: price),
            ProductDescription(label: label, rating: rating),
          ],
        ),
      ),
    );
  }
}
