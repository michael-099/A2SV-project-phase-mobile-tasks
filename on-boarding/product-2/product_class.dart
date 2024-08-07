class Product {
  String _name;
  String _description; 
  double _price;


  Product({required String name, required double price, required String description})
      : _name = name,
        _price = price,
        _description = description;


  String get name => _name;
  set name(String value) => _name = value;

  String get description => _description;
  set description(String value) => _description = value;

  double get price => _price;
  set price(double value) => _price = value;
}



// Named Parameters with required
// class Product {
//   String name;
//   String discription;
//   double price;

//   Product({required this.name, required this.price, required this.discription});
// }

// Positional Parameters
// class Product {
//   String name;
//   String discription;
//   double price;

//   Product(this.name, this.price, this.discription);
// }

// Named Parameters with Optional Fields
// class Product {
//   String? name;
//   String? discription;
//   double? price;

//   Product({this.name, this.price, this.discription});
// }





// NOTE
// Curly braces {} in a constructor in Dart are used to denote the body of the constructor,
// where you can add additional logic beyond just initializing fields.
//This includes validation, computations, initializing non-field variables, calling methods, etc.

// NOTE
// Named Parameters Constructor:
// Product({this.name, this.price, this.description});
// In this constructor, you are using named parameters.
//  By default, named parameters are nullable unless you specify required for each parameter.
//  If you want to ensure that these parameters are non-null, you should add the required keyword before each parameter.
//  Additionally, you should fix the typo in description (it was spelled as discription in your constructor).

// NOTE
// Positional Parameters Constructor:
// Product(this.name, this.price, this.description);
// In this constructor, you are using positional parameters.
// By default, positional parameters are required, so you must provide values for name, price, and description
//  when you create an instance of Product


// In essence, both constructors achieve the goal of initializing the Product class, but they handle parameters differently.
// Summary
// - Named Parameters: More flexible with ordering and can be more readable. You use the parameter names when instantiating the class.
// - Positional Parameters: Parameters must be given in the order they are declared. 


// 1. Named Parameters Constructor:
//     dart
//     Product({required this.name, required this.price, required this.description});
//     
//     - Parameter Style: Uses named parameters.
//     - Flexibility: Allows you to specify parameters in any order by name when creating an instance.
//     - Syntax: When instantiating, you use the parameter names, which can make code more readable and self-documenting.
//     - Null Safety: The required keyword ensures that these parameters cannot be null, enforcing that they must be provided.

//     Example usage:
//     dart
//     var product = Product(name: 'Widget', price: 19.99, description: 'A useful widget');
//     

// 2. Positional Parameters Constructor:
//     dart
//     Product(this.name, this.price, this.description);
//     
//     - Parameter Style: Uses positional parameters.
//     - Flexibility: Parameters must be provided in the exact order they are declared. 
//     - Syntax: When instantiating, you provide arguments in the same order as the constructor parameters.
//     - Null Safety: Parameters are required by default; you cannot omit them if you use the positional constructor.

//     Example usage:
//     dart
//     var product = Product('Widget', 19.99, 'A useful widget');
//     
// Both styles are functionally equivalent in terms of making the class work, but named parameters offer more readability and flexibility in some cases.

