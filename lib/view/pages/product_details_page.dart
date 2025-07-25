import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:e_commerce_app/view/widgets/counter_widgets.dart';
import 'package:e_commerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is ProductDetailsLoading ||
          current is ProductDetailsLoaded ||
          current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is ProductDetailsError) {
          return Scaffold(body: Center(child: Text(state.message)));
        } else if (state is ProductDetailsLoaded) {
          final product = state.product; 
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('product details '),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              ],
            ),
          
            body:
             Stack(
              children: [
                Container(
                  height: size.height * .45,
                  decoration: BoxDecoration(color: AppColors.grey2),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * .10),
                      CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        height: size.height * .35,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .44),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                        size: 25,
                                      ),
                                      Text(
                                        '${product.averageRate}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              BlocBuilder<
                                ProductDetailsCubit,
                                ProductDetailsState
                              >(
                                bloc: cubit,
                                buildWhen: (previous, current) =>
                                    current is QuantityCounterLoaded ||
                                    current is ProductDetailsLoaded,
                                builder: (context, state) {
                                  if (state is QuantityCounterLoaded) {
                                    return Counter(
                                      value: state.value,
                                      productId: product.id,
                                      cubit: cubit,
                                    );
                                  } else if (state is ProductDetailsLoaded) {
                                    return Counter(
                                      value: 1,
                                      productId: product.id,
                                      cubit: cubit,
                                    );
                                  } else {
                                    return SizedBox.shrink();
                                  }
                                },
                              ),
                            ],
                          ),
                         
                          SizedBox(height: 10),
                          Text(
                            'size',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                            bloc: cubit,
                            buildWhen: (previous, current) =>
                                current is SizeSelected ||
                                current is ProductDetailsLoaded,
                            builder: (context, state) {
                              return Row(
                                children: ProductSize.values
                                    .map(
                                      (size) => InkWell(
                                        onTap: () {
                                          if (state is SizeSelected) {}
                                          cubit.selectSize(size);
                                        },
                         
                                        highlightColor: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  state is SizeSelected &&
                                                      state.size == size
                                                  ? Theme.of(
                                                      context,
                                                    ).primaryColor
                                                  : AppColors.grey2,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text(
                                                size.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                      color:
                                                          state is SizeSelected &&
                                                              state.size == size
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Description ',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            product.description,
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(color: AppColors.grey),
                          ),
                          // Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${product.price} ',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              BlocBuilder<
                                ProductDetailsCubit,
                                ProductDetailsState
                              >(
                                bloc: cubit,
                                buildWhen: (previous, current) =>
                                    current is ProductAddedToCart ||
                                    current is ProductAddingToCart,
                                builder: (context, state) {
                                  if (state is ProductAddingToCart) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.white,
                                      ),
                                      onPressed: null,
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is ProductAddedToCart) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.white,
                                      ),
                                      onPressed: null,
                                      child: Text("Added To Cart"),
                                    );
                                  }
                                  return ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: AppColors.white,
                                    ),
                                    onPressed: () {
                                      if (cubit.selectedSize != null) {
                                        cubit.addToCart(product.id);
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text('Please Choose size'),
                                          ),
                                        );
                                      }
                                    },
                                    label: Text(
                                      'Add To Cart',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                          ),
                                    ),
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      color: AppColors.white,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
                         ),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("something went wrong ")),
          );
        }
      },
    );
  }
}
