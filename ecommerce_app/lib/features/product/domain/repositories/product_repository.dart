import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> viewSpecificProduct(String id);
  Future<Either<Failure, List<Product>>> viewAllProducts();
  Future<Either<Failure, Unit>> deleteProduct(String id);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, Product>> addProduct(Product product);
}