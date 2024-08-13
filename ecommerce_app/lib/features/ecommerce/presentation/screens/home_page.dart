import 'package:flutter/material.dart';

import '../widgets/product_card.dart';
import '../widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const TopBar(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 366,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Avilable Products',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(221, 59, 55, 55),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/searchProduct');
                          },
                          child: const Icon(Icons.search_rounded)),
                    ),
                  )
                ],
                
              ),
            ),
            SizedBox(
              height: 600,
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    
                    ProductCard(
                      productName: 'Derby Leather Shoes',
                      price: '\$200',
                      label: "Men's shoe",
                      rating: '4.5',
                    ),
                    ProductCard(
                      productName: 'Derby Leather Shoes',
                      price: '\$200',
                      label: "Men's shoe",
                      rating: '4.5',
                    ),
                    ProductCard(
                      productName: 'Derby Leather Shoes',
                      price: '\$200',
                      label: "Men's shoe",
                      rating: '4.5',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        backgroundColor: const Color.fromARGB(255, 0, 125, 227),
        child: const Text(
          '+',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
