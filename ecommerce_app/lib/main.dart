import 'package:flutter/material.dart';

import 'screens/add_product_page.dart';
import 'screens/details_page.dart';
import 'screens/home_page.dart';
import 'screens/search_product_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
        '/addProduct': (context) => const AddProductPage(),
        '/searchProduct': (context) => const SearchProductPage(),
      },
    )
  );
}
