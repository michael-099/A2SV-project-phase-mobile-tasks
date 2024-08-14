import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product/domain/usecases/add_a_product.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/product/domain/usecases/delete_a_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_a_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late DeleteProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = DeleteProduct(mockProductRepository);
  });

  // final product = Product(id: '02', name: 'name', description: 'description', price: 120, url: 'url');
  final int id=11;
  test(
    'should delete product to the repository and return the created entity.',
    () async {
      // Mocking a successful product addition
      when(mockProductRepository.deleteProduct(id))
          .thenAnswer((_) async => Right(unit));

      // Executing the use case
      final result = await usecase.execute(id: id);

      // Assertions
      expect(result, Right(unit));
      verify(mockProductRepository.deleteProduct(id));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );


  test(
    'should return a failure when the delete repository fails',
    () async {
      //arrange
      when(mockProductRepository.deleteProduct(any)).thenAnswer((_) async {
        return const Left(ServerFailure(''));
      });

      //act
      final result = await usecase.execute(id:id);

      //assert
      expect(result, const Left(ServerFailure('')));
      verify(mockProductRepository.deleteProduct(id));
    },
  );
}
