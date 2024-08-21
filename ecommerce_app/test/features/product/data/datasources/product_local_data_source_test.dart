import 'dart:convert';

import 'package:ecommerce_app/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixitures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

@GenerateMocks(
  [SharedPreferences],
)
void main() {
  ProductLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
    group(
      'getLastProduct',
      () {
        final tProductModel =
            ProductModel.fromJson(json.decode(fixture('product.json')));

        test(
          'should return Product from SharedPreferences when there is one in the cache',
          () async {
            // arrange
            when(mockSharedPreferences.getString(any as String))
                .thenReturn(fixture('product.json'));
            // act
            final result = await dataSource.getLastProduct();
            // assert
            verify(mockSharedPreferences.getString('CACHED_PRODUCT'));
            expect(result, equals(tProductModel));
          },
        );
      },
    );
    group('cacheProduct', () {
      final tProductModel = ProductModel(
          id: '02',
          name: 'name',
          description: 'description',
          price: 120,
          url: 'url');

      test('should call SharedPreferences to cache the data', () {
        // act
        dataSource.cacheProducts([tProductModel]);
        // assert
        final expectedJsonString = json.encode(tProductModel.toJson());
        verify(mockSharedPreferences.setString(
          'CACHED_PRODUCT',
          expectedJsonString,
        ));
      });
    });
  });
}

