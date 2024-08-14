import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/product/domain/usecases/view_specific_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'view_specific_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late ViewSpecificProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = ViewSpecificProduct(mockProductRepository);
  });

  final product = Product(id: '02', name: 'name', description: 'description', price: 120, url: 'url');
 String id ='11';
  test(
    'should update product to the repository and return the created entity.',
    () async {
      // Mocking a successful product addition
      when(mockProductRepository.viewSpecificProduct(id))
          .thenAnswer((_) async => Right(product));

      // Executing the use case
      final result = await usecase.execute(id: id);

      // Assertions
      expect(result, Right(product));
      verify(mockProductRepository.viewSpecificProduct(id));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );

  test(
    'should return a Failure when the repository fails',
    () async {
      // Mocking a failure in the repository
      when(mockProductRepository.viewSpecificProduct(id))
          .thenAnswer((_) async => const Left(NetworkFailure('')));

      // Executing the use case
      final result = await usecase.execute(id: id);

      // Assertions
      expect(result, const Left(NetworkFailure('')));
      verify(mockProductRepository.viewSpecificProduct(id));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
