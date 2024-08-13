import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String url;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.url,
  });

  List<Object?> get props => [
        name,
        id,
        description,
        price,
        url,
      ];

  //  the above code List<Object?> get props ... implements the Equatable package.
  //Specifically, the props getter is used
  //to define the properties that should be compared
  //when checking for object equality.
}
