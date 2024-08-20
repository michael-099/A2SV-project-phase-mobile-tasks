import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);
  Future<Either<Failure, Unit>> execute({required String id }) 
  async {
    return await repository.deleteProduct(id);
  }
}
