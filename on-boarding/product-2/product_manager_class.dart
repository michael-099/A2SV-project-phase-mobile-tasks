import "dart:io";

import '../product-2/product_class.dart';

class ProductManager {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    print("product successfuly added");
  }

  void viewAllProduct() {
    if (products.isEmpty) {
      print("empty Product");
    } else {
      print("product" + "|" + "description" + "|" + "price");
      for (int i = 0; i < products.length; i++) {
        print(products[i].name +
            "|" +
            products[i].description +
            "|" +
            products[i].price.toString());
      }
    }
  }

  void viewSingleProduct(String product) {
    for (int i = 0; i < products.length; i++) {
      if (product == products[i].name) {
        print(products[i].name +
            "|" +
            products[i].description +
            "|" +
            products[i].price.toString());

        break;
      }
    }
  }

  editProduct() {
    print("name of the product to edit");
    String? product = stdin.readLineSync();
    if (product == null) {
      return;
    }

    for (int i = 0; i < products.length; i++) {
      if (product == products[i].name) {
        print("press 1 to edit name ");
        print("press 2 to edit description ");
        print("press 3 to edit price ");
        print("press 4 to edit all ");
        String? input = stdin.readLineSync();
        if (input == null) {
          print("no input detacted");
        } else {
          if (input == "1") {
            print("enter the new name ");
            String? inputName = stdin.readLineSync();
            if (inputName != null) {
              products[i].name = inputName;
            }
            print("null input");
          }

          if (input == "2") {
            print("enter the new discreption ");
            String? inputDiscription = stdin.readLineSync();
            if (inputDiscription != null) {
              products[i].description = inputDiscription;
            }
            print("null input");
          }

          if (input == "3") {
            print(" enter the new price ");
            String? inputPrice = stdin.readLineSync();
            if (inputPrice != null) {
              double newPrice = double.parse(inputPrice);
              products[i].price = newPrice;
            }
          }

          if (input == "4") {
            print("enter the new name  ");
            String? inputName = stdin.readLineSync();
            if (inputName != null) {
              products[i].name = inputName;
            }

            print("enter the new discreption ");
            String? inputDiscription = stdin.readLineSync();
            if (inputDiscription != null) {
              products[i].description = inputDiscription;
            }

            print(" enter the new price ");
            String? inputPrice = stdin.readLineSync();
            if (inputPrice != null) {
              double newPrice = double.parse(inputPrice);
              products[i].price = newPrice;
            }
          }
        }
      }
    }
    print("not Found");
  }

  void deleteProduct(String product) {
    for (int i = 0; i < products.length; i++) {
      if (product == products[i].name) {
        print(products[i].name);
        products.remove(products[i]);
        break;
      }
    }
    print("not Found");
  }
}
