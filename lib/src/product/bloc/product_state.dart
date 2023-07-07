part of 'product_bloc.dart';

final class ProductState extends Equatable {
  final String name;
  final String image;
  final String quantity;
  final bool isComplete;

  const ProductState({
    this.name = '',
    this.image = 'assets/images/apple.jpg',
    this.quantity = '1',
    this.isComplete = false,
  });


  ProductState copyWith({
    String? name,
    String? image,
    String? quantity,
    bool? isComplete
  }) {
    return ProductState(
      name: name ?? this.name,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      isComplete: isComplete ?? this.isComplete,
    );
  }
  
  @override
  List<Object> get props => [];
}
