import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/home_carousel_item_model.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:e_commerce_app/view/widgets/category_tap_view.dart';
import 'package:e_commerce_app/view/widgets/home_tap_view.dart';
import 'package:e_commerce_app/view/widgets/prodact_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tapController;

  @override
  void initState() {
    super.initState();
    _tapController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                        ),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'youssef',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                'let\'s go shopping',
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              TabBar(
                unselectedLabelColor: AppColors.grey,
                controller: _tapController,
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Category'),
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child: TabBarView(
                  controller: _tapController,
                  children: [HomeTapView(), CategoryTapView()],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
