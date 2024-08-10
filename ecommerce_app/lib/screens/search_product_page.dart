import 'package:flutter/material.dart';

import '../widgets/product_card.dart';
import '../widgets/top_bar.dart';
import '../widgets/filter_prodact.dart';
import '../widgets/custom_text_field.dart';

class SearchProductPage extends StatefulWidget {
  @override
  _SearchProductPageState createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Center(
            child: Text(
              "Search product",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 366,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 290,
                          height: 40,
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.arrow_forward),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                            style: const TextStyle(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: 66,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          
                            onPressed: () {},
                            child: const Icon(Icons.line_style_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
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
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: FilterProdactWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
