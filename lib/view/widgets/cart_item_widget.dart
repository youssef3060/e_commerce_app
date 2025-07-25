import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/add_to_cart_model.dart';
import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:e_commerce_app/view/widgets/counter_widgets.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: cartItem.product.imageUrl,
              height: 125,
              width: 125,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'size : ${cartItem.size.name}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CartCubit, CartState>(
                      bloc: BlocProvider.of<CartCubit>(context),
                      buildWhen: (previous, current) =>
                          current is QuantityCounterLoaded,
                      builder: (context, state) {
                        if (state is QuantityCounterLoaded  &&
                            state.productId == cartItem.product.id) {
                          return Counter(
                            value: state.value,
                            productId: cartItem.product.id,
                            cubit: cubit,
                          );
                        }
                        return Counter(
                          value: cartItem.quantity,
                          productId: cartItem.product.id,
                          cubit: cubit,
                          initialValue: cartItem.quantity,
                        );
                      },
                    ),

                    Text(
                      '\$${cartItem.product.price}',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
