import 'package:e_commerce_app/view/pages/favorit_page.dart';
import 'package:e_commerce_app/view/pages/home_page.dart';
import 'package:e_commerce_app/view/pages/my_order_page.dart';
import 'package:e_commerce_app/view/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
    late final PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

   final List<PersistentTabConfig> _tabs = [
    PersistentTabConfig(
      screen: HomePage(),
      item: ItemConfig(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent
      ),
    ),
    PersistentTabConfig(
      screen: MyOrderPage(),
      item: ItemConfig(
        icon: Icon(Icons.shopping_cart),
        title: "Orders",
         activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent
      ),
    ),
    PersistentTabConfig(
      screen: FavoritePage(),
      item: ItemConfig(
        icon: Icon(Icons.favorite),
        title: "Favorites",
         activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent
      ),
    ),
    PersistentTabConfig(
      screen: ProfilePage(),
      item: ItemConfig(
        icon: Icon(Icons.person),
        title: "Profile",
         activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent
      ),
    ),
  ];

  
  @override
  Widget build(BuildContext context) {
     return PersistentTabView(
      controller: _controller,
      tabs: _tabs,
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        
      ),
      
    );
  }
}
