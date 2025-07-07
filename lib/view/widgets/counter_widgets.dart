import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int value;
  const Counter({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.grey),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
            Text(value.toString()),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
