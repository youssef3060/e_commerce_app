import 'package:cached_network_image/cached_network_image.dart';
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
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsCubit>(context),
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

            body: Stack(
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
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
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
                              Counter(value: 10),
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
