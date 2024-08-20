import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewSpecificProduct {
  final ProductRepository repository;

  ViewSpecificProduct(this.repository);
  Future<Either<Failure, Product>> execute({required String id}) 
  async {
    return await repository.viewSpecificProduct(id);
  }
}
