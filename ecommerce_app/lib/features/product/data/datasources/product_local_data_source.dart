import 'dart:convert';

import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<ProductModel> getLastProduct();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});
 @override
Future<void> cacheProducts(List<ProductModel> products) {
  final List<Map<String, dynamic>> jsonProducts = products.map((product) => product.toJson()).toList();
  return sharedPreferences.setString(
    "CACHED_PRODUCT",
    json.encode(jsonProducts),
  );
}


  @override
  Future<ProductModel> getLastProduct() {
    final String? jsonString = sharedPreferences.getString('CACHED_PRODUCT');
    return Future.value(ProductModel.fromJson(json.decode(jsonString!)));
  }
}
