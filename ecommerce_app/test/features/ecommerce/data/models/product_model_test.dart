import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  final tProduct = ProductModel(
      id: '02',
      name: 'name',
      description: 'description',
      price: 120,
      url: 'url');

  test('should be a subclass of Product entity', () async {
    expect(tProduct, isA<Product>());
  });
}
