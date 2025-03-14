import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    this.isMain = false,
  });

  final String image, title;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    final categoryTitle = Text(
      title,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
    final categoryImage = ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Image.network(
        image,
        width: isMain ? 356.w : 159.w,
        height: isMain ? 150.h : 145.h,
        fit: BoxFit.cover,
      ),
    );
    return Column(
      spacing: isMain ? 3 : 6,
      children: [
        isMain ? categoryTitle : categoryImage,
        isMain ? categoryImage : categoryTitle,
      ],
=======
import 'package:go_router/go_router.dart';
import '../../../core/sizes.dart';
import '../../data/models/category_model.dart';

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
>>>>>>> origin/main
    );
  }
}
