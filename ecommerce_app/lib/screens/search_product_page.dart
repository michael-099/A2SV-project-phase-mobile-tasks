import 'package:flutter/material.dart';

import '../widgets/product_card.dart';
import '../widgets/top_bar.dart';
import '../widgets/filter_prodact.dart';

class SearchProductPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Align(
              alignment: Alignment.center,
              child: Text(
                "Search product",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 0),
                    child: Column(
                      children: [
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
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: FilterProdactWidget(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
