import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/view/pages/custom_bottom_navbar.dart';
import 'package:e_commerce_app/view/pages/product_details_page.dart';
import 'package:e_commerce_app/view_models/product_details_cubit/product_details_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.productDetailRoute:
        final String productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(productId);

              return cubit;
            },
            child: ProductDetailsPage(productId: productId),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('error'))),
          settings: settings,
        );
    }
  }
}
