import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewAllProducts {
  final ProductRepository repository;

  ViewAllProducts(this.repository);
  Future<Either<Failure, List<Product>>>execute() 
  async {
    return await repository.viewAllProducts();
  }
}
