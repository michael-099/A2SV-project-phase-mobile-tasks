import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
  Future<ProductModel> getLastProduct();
  Future<void> cacheProducts(List<Product> products);
}

class ProductLocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheProducts(List<Product> products) {
    // TODO: implement cacheProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getLastProduct() {
    // TODO: implement getLastProduct
    throw UnimplementedError();
  }
}
