import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product {
  String id;
  String name;
  String description;
  double price;
  String url;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.url,
  });
}
