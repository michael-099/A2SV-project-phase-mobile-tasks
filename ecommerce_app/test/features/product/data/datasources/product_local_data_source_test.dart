import 'dart:convert';

import 'package:ecommerce_app/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  ProductLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
    group('getLastProduct', () {
      final tProductModel = ProductModel.fromJson(
          json.decode(fixture('trivia_cached.json')));

      test(
        'should return Product from SharedPreferences when there is one in the cache',
        () async {
          // arrange
          when(mockSharedPreferences.getString(any))
              .thenReturn(fixture('trivia_cached.json'));
          // act
          final result = await dataSource.getLastProduct();
          // assert
          verify(mockSharedPreferences.getString('CACHED_NUMBER_TRIVIA'));
          expect(result, equals(tProductModel));
        },
      );
    });
  });
}
