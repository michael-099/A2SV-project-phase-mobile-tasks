import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/ecommerce/domain/usecases/add_a_product.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_a_product_test.mocks.dart'; 


@GenerateMocks([
  ProductRepository
])
void main() {
  late AddProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = AddProduct(mockProductRepository);
  });

  final product = Product(id: '02', name: 'name', description: 'description', price: 120, url: 'url');

  test(
    'should add new product to the repository and return the created entity.',
    () async {
      // Mocking a successful product addition
      when(mockProductRepository.addProduct(product))
          .thenAnswer((_) async => Right(product)); 
      
      // Executing the use case
      final result = await usecase.execute(product: product);

      // Assertions
      expect(result, Right(product));
      verify(mockProductRepository.addProduct(product));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );

  test(
    'should return a Failure when the repository fails',
    () async {
      // Mocking a failure in the repository
      when(mockProductRepository.addProduct(product))
          .thenAnswer((_) async => const Left(NetworkFailure("Failed to add product")));
    
      // Executing the use case
      final result = await usecase.execute(product: product);

      // Assertions
      expect(result, const Left(NetworkFailure("Failed to add product")));
      verify(mockProductRepository.addProduct(product));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
