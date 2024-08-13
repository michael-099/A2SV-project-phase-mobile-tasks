import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entites/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getSpecificProduct(int id);
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Unit>> deleteProduct(int id);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, Product>> addProduct(Product product);
}