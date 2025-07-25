import 'dart:math';

import 'package:e_commerce_app/view/pages/cart_page.dart';
import 'package:e_commerce_app/view/pages/favorit_page.dart';
import 'package:e_commerce_app/view/pages/home_page.dart';

import 'package:e_commerce_app/view/pages/profile_page.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  final List<PersistentTabConfig> _tabs = [
    PersistentTabConfig(
      screen: BlocProvider(
        create: (context) {
          final cubit = HomeCubit();
          cubit.getHomeData();

          return cubit;
        },
        child: HomePage(),
      ),
      item: ItemConfig(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent,
      ),
    ),
    PersistentTabConfig(
      screen: BlocProvider(
        create: (context) {
          final cubit = CartCubit();
          cubit.getCartItems();
          return cubit;
        },
        child: CartPage(),
      ),
      item: ItemConfig(
        icon: Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent,
      ),
    ),
    PersistentTabConfig(
      screen: FavoritePage(),
      item: ItemConfig(
        icon: Icon(Icons.favorite),
        title: "Favorites",
        activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent,
      ),
    ),
    PersistentTabConfig(
      screen: ProfilePage(),
      item: ItemConfig(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColorSecondary: Colors.blue,
        inactiveBackgroundColor: Colors.greenAccent,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
           AppBar(
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Youssef', style: Theme.of(context).textTheme.labelLarge),
                  Text(
                    'Let\'s Go shopping',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.blueGrey),
                  ),
                ],
              ),
              actions: [
                if (_currentIndex == 0)... [// Show only on HomePage
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                    ],
                  )]
                  else if 
  (_currentIndex == 1) ... [ // Show only on CartPage
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),]
            else...[// Show on other pages
              ]
            
      
  ]),
      body: PersistentTabView(
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        stateManagement: true,
        controller: _controller,
        tabs: _tabs,
        navBarBuilder: (navBarConfig) =>
            Style6BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
