import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
   Future< ProductModel> viewSpecificProduct(String id);
  Future< List<ProductModel>> viewAllProducts();
  Future<void> cacheAllProducts(List<Product> products);
}

class ProductLocalDataSourceImpl implements LocalDataSource{
  @override
  Future<void> cacheAllProducts(List<Product> products) {
    // TODO: implement cacheAllProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> viewAllProducts() {
    // TODO: implement viewAllProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> viewSpecificProduct(String id) {
    // TODO: implement viewSpecificProduct
    throw UnimplementedError();
  }

}


