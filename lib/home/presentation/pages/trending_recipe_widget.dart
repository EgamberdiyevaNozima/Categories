import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_project1/category_detail/data/models/recipe_model.dart';
import '../../../category_detail/presentation/widgets/recipe_rating.dart';
import '../../../category_detail/presentation/widgets/recipe_time.dart';
import '../../../core/utils/app_colors.dart';
import 'home_page_view_model.dart';

class TrendingRecipeWidget extends StatelessWidget {
  const TrendingRecipeWidget({
    super.key,required this.recipe
  });
 final RecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
      child: Column(
        spacing: 9,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Recipe",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image(
                  image: NetworkImage(recipe.photo),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                width: 350.w,
                height: 49.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
                  border: Border(
                    left: BorderSide(color: AppColors.pinkSub),
                    right: BorderSide(color: AppColors.pinkSub),
                    bottom: BorderSide(color: AppColors.pinkSub),
                  ),
                  color: AppColors.beigeColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Salami and cheese pizza",
                          style: TextStyle(color: AppColors.milkWhite),
                        ),
                        RecipeTime(timeRequired: 30),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "This is a quick overview of the ingredients",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: AppColors.milkWhite,
                          ),
                        ),
                        RecipeRating(
                          rating: 5,
                          // svgColor: AppColors.pinkSub,
                          // textColor: AppColors.pinkSub,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
