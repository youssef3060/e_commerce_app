import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final selectedProduct = dummyProduct.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(product: selectedProduct));
    });
  }

  void incrementCounter(String productId) {
    final selectedIndex = dummyProduct.indexWhere(
      (item) => item.id == productId,
    );
    dummyProduct[selectedIndex] = dummyProduct[selectedIndex].copyWith(
      quantity: dummyProduct[selectedIndex].quantity + 1,
    );
    emit(QuantityCounterLoaded(value: dummyProduct[selectedIndex].quantity));
  }

  void decrementCounter(String productId) {
    final selectedIndex = dummyProduct.indexWhere(
      (item) => item.id == productId,
    );
    if (dummyProduct[selectedIndex].quantity > 1) {
      dummyProduct[selectedIndex] = dummyProduct[selectedIndex].copyWith(
        quantity: dummyProduct[selectedIndex].quantity - 1,
      );
      emit(QuantityCounterLoaded(value: dummyProduct[selectedIndex].quantity));
    }
  }
}
