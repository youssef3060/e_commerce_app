import 'package:e_commerce_app/models/add_to_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int quantity = 1;
  void getCartItems() {
    emit(CartLoading());

    emit(CartLoaded(cartItems: dummyCart));
  }

  void decrementCounter(String productId) {
    quantity--;

    emit(QuantityCounterLoaded(value: quantity));
  }

  void incrementCounter(String productId) {
    quantity++;

    emit(QuantityCounterLoaded(value: quantity));
  }
}
