import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryTapView extends StatelessWidget {
  const CategoryTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyCategory.length,
      itemBuilder: (BuildContext context, int index) {
        final category = dummyCategory[index];
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: category.bgColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: category.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${category.productsCount} Products',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: category.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
