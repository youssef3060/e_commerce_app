import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:e_commerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int value;
  final String productId;
  final dynamic cubit;
  const Counter({
    super.key,
    required this.value,
    required this.productId,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey2,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () => cubit.decrementCounter(productId),
                child: Icon(Icons.remove, color: AppColors.black, size: 30),
              ),
            ),
            SizedBox(width: 10),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(width: 10),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey2,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () => cubit.incrementCounter(productId),
                child: Icon(Icons.add, color: AppColors.black, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
