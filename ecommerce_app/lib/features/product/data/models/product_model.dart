import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required id,
    required name,
    required description,
    required price,
    required url,
  }) : super(
            description: description,
            id: id,
            name: name,
            price: price,
            url: url);
}
