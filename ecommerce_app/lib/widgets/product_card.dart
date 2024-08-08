import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
  String productName;
  String price;
  String label;
  String rating;
  double width;
  double height;

  ProductCard(
      {required this.productName,
      required this.price,
      required this.label,
      required this.rating,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 50,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade700),
                  ),
                  Text(
                    price,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(color: Colors.black26),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_half_rounded,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        rating,
                        style: const TextStyle(color: Colors.black26),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
