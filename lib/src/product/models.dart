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