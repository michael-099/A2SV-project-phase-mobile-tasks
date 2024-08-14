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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      url: json['url']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'url': url
      };
}
