import 'package:dartz/dartz.dart';

import '../../domain/entities/product.dart';

abstract class ProductLocalDataSource {
  Future<Product> getSpecificProduct(int id);
  Future<List<Product>> getAllProducts();
  Future<Unit> deleteProduct(int id);
  Future<Product> updateProduct(Product product);
  Future<Product> addProduct(Product product);
}
