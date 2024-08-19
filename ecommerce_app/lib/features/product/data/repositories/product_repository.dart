import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepository {
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        final ProductModel productModel = ProductModel.fromEntity(product);
        final result = await remoteDataSource.addProduct(productModel);
        final resultEntity = result;
        return Right(resultEntity);
      } catch (e) {
        return const Left(ServerFailure(''));
      }
    } else {
      return const Left(NetworkFailure(''));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.deleteProduct(id);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(''));
      }
    } else {
      return const Left(NetworkFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> viewAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.viewAllProducts();
        // List<ProductModel> 
        localDataSource.cacheProducts(remoteProducts);
        final List<Product> productEntities = remoteProducts;
        return Right(productEntities);
      } on ServerException {
        return const Left(ServerFailure(''));
      }
    } else {
      try {
        final result = await localDataSource.getLastProduct();
        // might make an error 
        Product res = result;
        final List<Product> productEntities = [res];
        return Right(productEntities);
      } on CacheException {
        return const Left(CacheFailure(''));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> viewSpecificProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.viewSpecificProduct(id);
        return Right(remoteProduct);
      } on ServerException {
        return const Left(ServerFailure(''));
      }
    } else {
      try {
        final result = await localDataSource.getLastProduct();
        final Product resultEntity = result.toEntity();
        return Right(resultEntity);
      } catch (e) {
        return const Left(CacheFailure(''));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        final ProductModel productModel = ProductModel.fromEntity(product);
        debugPrint('to model conversion success');
        final remoteProduct =
            await remoteDataSource.updateProduct(productModel);
        debugPrint('remote data source connection success');
        return Right(remoteProduct);
      } on ServerException {
        debugPrint('Server error online');
        return const Left(ServerFailure(''));
      }
    } else {
      return const Left(NetworkFailure(''));
    }
  }
}

void main() {}

// import 'package:dartz/dartz.dart';

// import '../../../../core/error/failure.dart';
// import '../../domain/entities/product.dart';
// import '../../domain/repositories/product_repository.dart';
// import '../datasources/product_local_data_source.dart';
// import '../datasources/product_remote_data_source.dart';
// import 'package:ecommerce_app/core/platform/network_info.dart';

// class ProductRepositoryImpl implements ProductRepository {
//   final NetworkInfo networkInfo;
//   final LocalDataSource localDataSource;
//   final RemoteDataSource remoteDataSource;

//   ProductRepositoryImpl({
//     required this.networkInfo,
//     required this.localDataSource,
//     required this.remoteDataSource,
//   });

//   @override
//   Future<Either<Failure, Product>> addProduct(Product product) {
//     // TODO: implement addProduct
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, Unit>> deleteProduct(String id) {
//     // TODO: implement deleteProduct
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, Product>> updateProduct(Product product) {
//     // TODO: implement updateProduct
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, List<Product>>> viewAllProducts() {
//     // TODO: implement viewAllProducts
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, Product>> viewSpecificProduct(String id) async{
//     networkInfo.isConnected;
//     // String id ;
//     return Right (await remoteDataSource.viewSpecificProduct(id));
   
  
//   }
// }
