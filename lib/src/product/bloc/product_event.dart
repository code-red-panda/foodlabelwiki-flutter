part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class NameChanged extends ProductEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

final class ImageChanged extends ProductEvent {
  final String image;

  const ImageChanged(this.image);

  @override
  List<Object> get props => [image];
}

final class QuantityChanged extends ProductEvent {
  final String quantity;

  const QuantityChanged(this.quantity);

  @override
  List<Object> get props => [quantity];
}

final class UpdateProduct extends ProductEvent {
  const UpdateProduct();
}
