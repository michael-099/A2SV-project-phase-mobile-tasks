import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.label,
    required this.rating,
  });

  final String label;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
