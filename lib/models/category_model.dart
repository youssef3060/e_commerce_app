import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final int productsCount;
  final Color bgColor;
  final Color textColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.productsCount,
    this.bgColor = AppColors.primary,
    this.textColor = AppColors.white,
  });
}

List<CategoryModel> dummyCategory = [
  CategoryModel(
    id: '1',
    name: 'New Arrivals',
    productsCount: 208,
    bgColor: AppColors.grey,
    textColor: AppColors.black,
  ),
  CategoryModel(
    id: '2',
    name: 'Clothes',
    productsCount: 358,
    bgColor: AppColors.green,
    textColor: AppColors.white,
  ),
  CategoryModel(
    id: '3',
    name: 'Bags',
    productsCount: 160,
    bgColor: AppColors.black,
    textColor: AppColors.white,
  ),
  CategoryModel(
    id: '4',
    name: 'Shoes',
    productsCount: 230,
    bgColor: AppColors.grey,
    textColor: AppColors.black,
  ),
  CategoryModel(
    id: '5',
    name: 'Electronics',
    productsCount: 101,
    bgColor: AppColors.blue,
    textColor: AppColors.white,
  ),
];
