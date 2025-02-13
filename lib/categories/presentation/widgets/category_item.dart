
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/sizes.dart';
import '../../data/models/categories_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.main = false,
    this.width = 159,
    this.height = 145,
  });

  final CategoryModel category;
  final double width, height;
  final bool main;

  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          category.image,
          width: width * AppSizes.wRatio,
          height: height * AppSizes.hRatio,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget title = Text(category.title);
    return GestureDetector(
      onTap: () => context.go('/categories/detail', extra: category),
      child: Column(
        children: [
          main ? title : image,
          SizedBox(height: 5),
          main ? image : title,
        ],
      ),
    );
  }
}




