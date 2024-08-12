import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/search_product_page.dart';
import 'screens/add_product_page.dart';
import 'screens/details_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/details": (context) => DetailsPage(),
        "/addProduct": (context) => AddProductPage(),
        "/searchProduct": (context) => SearchProductPage(),
      },
    ),
  );
}
