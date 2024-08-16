import 'package:dartz/dartz.dart';

import '../../domain/entities/product.dart';

abstract class RemoteDataSource {
  Future<Product> viewSpecificProduct(String id);
  Future<List<Product>> viewAllProducts();
  Future<Unit> deleteProduct(String id);
  Future<Product> updateProduct(Product product);
  Future<Product> addProduct(Product product);
}
