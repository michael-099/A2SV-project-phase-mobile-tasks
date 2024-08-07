import "./product_manager_class.dart";
import 'product_class.dart';

void main() {
  ProductManager productManager = ProductManager();
  Product product1 = Product(name: "top", description: "water", price: 25);
  Product product2 = Product(name: "yes", description: "water", price: 25);
  Product product3 = Product(name: "gold", description: "water", price: 25);

  productManager.addProduct(product1);
  productManager.addProduct(product2);
  productManager.addProduct(product3);

  productManager.viewAllProduct();
  productManager.deleteProduct("gold");
  productManager.viewAllProduct();
  productManager.editProduct();
  productManager.viewAllProduct();
}
