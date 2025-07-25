import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:e_commerce_app/view/widgets/category_tap_view.dart';
import 'package:e_commerce_app/view/widgets/home_tap_view.dart';
import 'package:e_commerce_app/view_models/home_cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
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
    );
  }
}
