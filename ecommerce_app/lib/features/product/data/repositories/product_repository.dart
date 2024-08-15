import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/core/platform/network_info.dart';
class ProductRepositoryImpl implements ProductRepository {
   final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });
  
  @override
  Future<Either<Failure, Product>> addProduct(Product product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Product>>> viewAllProducts() {
    // TODO: implement viewAllProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> viewSpecificProduct(String id) {
    // TODO: implement viewSpecificProduct
    throw UnimplementedError();
  }
  
}
