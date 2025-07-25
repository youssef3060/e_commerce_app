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

  void decrementCounter(String productId,   [int? initialValue]) {
    if (initialValue != null ) {
     quantity = initialValue ;
    }
    if (quantity >= 1) {
      quantity--;
    
    }
    

    emit(QuantityCounterLoaded(value: quantity , productId: productId));
  }

  void incrementCounter(String productId,  [int? initialValue]) {
      if (initialValue != null ) {
     quantity = initialValue ; }

     quantity++;

    emit(QuantityCounterLoaded(value: quantity , productId: productId));
  }
}
