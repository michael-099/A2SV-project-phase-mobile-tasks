import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
   Future< ProductModel> viewSpecificProduct(String id);
  Future< List<ProductModel>> viewAllProducts();
  Future<void> cacheAllProducts(List<Product> products);
}


