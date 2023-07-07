class Product {
  final String name;
  final String image;
  final String quantity;
  final bool isComplete;

  const Product({
    required this.name,
    this.image = 'assets/images/apple.jpg',
    this.quantity = '1',
    this.isComplete = false,
  });
}

class Aisle {
  final String name;
  List<Product>? products;
  bool allProductsComplete;
  int sort;

  Aisle({
    required this.name,
    this.products,
    this.allProductsComplete = false,
    this.sort = 1,
  });
}

class Store {
  final String name;
  List<Aisle>? aisles;

  Store({
    required this.name,
    this.aisles,
  });
}
