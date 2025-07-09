import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/add_to_cart_model.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CachedNetworkImage(imageUrl: cartItem)
      ],
    );
  }
}
