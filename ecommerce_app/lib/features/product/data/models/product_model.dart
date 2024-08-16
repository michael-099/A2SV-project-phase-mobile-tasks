import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required id,
    required name,
    required description,
    required double price,
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
      price: (json['price'] as num).toDouble(),
      url: json['url']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'url': url
      };

  Product toEntity() {
    return ProductModel(
        id: id, name: name, price: price, description: description, url: url);
  }

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      name: entity.name,
      description: entity.description,
      price: entity.price,
      id: entity.id,
      url: entity.url,
    );
  }
}
