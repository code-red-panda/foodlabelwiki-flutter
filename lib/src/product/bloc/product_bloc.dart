import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<NameChanged>(_onNameChanged);
    on<ImageChanged>(_onImageChanged);
    on<QuantityChanged>(_onQuantityChanged);
    on<UpdateProduct>(_onUpdateProduct);
  }

  void _onNameChanged(
    NameChanged event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  void _onImageChanged(
    ImageChanged event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(image: event.image));
  }

  void _onQuantityChanged(
    QuantityChanged event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(quantity: event.quantity));
  }

  void _onUpdateProduct(
    UpdateProduct event,
    Emitter<ProductState> emit,
  ) {
    print('update product in realm');
  }
}
