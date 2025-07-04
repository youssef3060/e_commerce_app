import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/view/pages/custom_bottom_navbar.dart';
import 'package:e_commerce_app/view/pages/product_details_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/app_router.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => CustomBottomNavbar());
      case AppRoutes.productDetailRoute:
        return MaterialPageRoute(builder: (_) => ProductDetailsPage());
    }
  }
}
