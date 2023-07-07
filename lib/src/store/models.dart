import 'store.dart';

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
