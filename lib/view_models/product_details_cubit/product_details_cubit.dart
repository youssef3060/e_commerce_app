import 'package:e_commerce_app/models/add_to_cart_model.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  ProductSize? selectedSize;
  int quantity = 1;

  getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final selectedProduct = dummyProduct.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(product: selectedProduct));
    });
  }

  void selectSize(ProductSize size) {
    selectedSize = size;
    emit(SizeSelected(size: size));
  }

  void addToCart(String productId) {
    emit(ProductAddingToCart());

    final cartItem = AddToCartModel(
      product: dummyProduct.firstWhere((item) => item.id == productId),
      size: selectedSize!,
      quantity: quantity,
      id: DateTime.now().toIso8601String(),
    );
    debugPrint("added to cart ##########################################");
    dummyCart.add(cartItem);
    Future.delayed(Duration(seconds: 1), () {
      emit(ProductAddedToCart(productId: productId));
    });
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
