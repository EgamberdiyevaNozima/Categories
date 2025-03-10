import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app_project1/home/presentation/pages/recipes_item_container.dart';

import '../../../category_detail/data/models/recipe_model.dart';
import '../../../core/utils/app_colors.dart';
import '../image_dart.dart';

class YourRecipesWidget extends StatelessWidget {
  const YourRecipesWidget({
    super.key,required this.recipe
  });
  final RecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 38.w),
      width: double.infinity,
      height: 255,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Recipes",
            style: TextStyle(
              color: AppColors.milkWhite,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipesItemContainer(
                image: recipe.photo,
                title: 'Breakfast',
                rating: 5,
                time: 15,
              ),
              RecipesItemContainer(
                image: recipe.photo,
                title: 'Dessert',
                rating: 4,
                time: 20,
              ),
            ],
          ),
        ],
      ),

    );
  }
}


