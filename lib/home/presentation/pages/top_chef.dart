import 'package:flutter/material.dart';

import '../../../category_detail/data/models/recipe_model.dart';
import '../../../core/utils/app_colors.dart';
import '../image_dart.dart';

class TopChef extends StatelessWidget {
  const TopChef({super.key,required this.recipe});
  final RecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Chef",
            style: TextStyle(color: AppColors.redPinkMain),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.network(recipe.photo),
                  const Text(
                    "Joseph",
                    style: TextStyle(
                        color: AppColors.whiteColor, fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(recipe.photo),
                  const Text(
                    "Andrew ",
                    style: TextStyle(
                        color: AppColors.whiteColor, fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(recipe.photo),
                  const Text(
                    "Emily",
                    style: TextStyle(
                        color: AppColors.whiteColor, fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(recipe.photo),
                  const Text(
                    "Jessica",
                    style: TextStyle(
                        color: AppColors.whiteColor, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Recently Added",
            style:
            TextStyle(color: AppColors.textColor, fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.tos),
              Image.asset(AppImages.lim),
            ],
          ),
        ],
      ), );
  }
}