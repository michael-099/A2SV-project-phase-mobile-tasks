import 'package:flutter/material.dart';

import 'features/product/presentation/screens/add_product_page.dart';
import 'features/product/presentation/screens/details_page.dart';
import 'features/product/presentation/screens/home_page.dart';
import 'features/product/presentation/screens/search_product_page.dart';

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
