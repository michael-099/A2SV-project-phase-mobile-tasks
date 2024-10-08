import 'dart:convert';

import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixitures/json_reader.dart';

void main() {
  final tProduct = ProductModel(
      id: '02',
      name: 'name',
      description: 'description',
      price: 120,
      url: 'url');

  test(
    'should be a subclass of Product entity',
    () async {
      const path = 'fixitures/dummy.dart';
      final Map<String, dynamic> jsonMap =
          json.decode(readJson(path));
      // expect(tProduct, isA<Product>());

      final result = ProductModel.fromJson(jsonMap);

      expect(result, equals(tProduct));
    },
  );

  test('should return a json map containing proper data', () async {
    final result = tProduct.toJson();

    final expectedJsonMap = {
      'id': '02',
      'name': 'name',
      'description': 'description',
      'price': 120,
      'url': 'url'
    };

    expect(result, equals(expectedJsonMap));
  });
}
