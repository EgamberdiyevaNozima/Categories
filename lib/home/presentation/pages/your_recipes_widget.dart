import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app_project1/home/presentation/pages/recipes_item_container.dart';

import '../../../core/utils/app_colors.dart';
import '../image_dart.dart';

class YourRecipesWidget extends StatelessWidget {
  const YourRecipesWidget({
    super.key,
  });

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
                image: 'assets/images/breakfast.png',
                title: 'Breakfast',
                rating: 5,
                time: 15,
              ),
              RecipesItemContainer(
                image: 'assets/images/lunch.png',
                title: 'Dessert',
                rating: 4,
                time: 20,
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Top Chef",
                  style: TextStyle(color: AppColors.textColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(AppImages.ch2),
                        const Text(
                          "Joseph",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(AppImages.ch1),
                        const Text(
                          "Andrew ",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(AppImages.ch3),
                        const Text(
                          "Emily",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(AppImages.ch4),
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
                // BottomNavigationBar()
              ],
            ),
          )
        ],
      ),
    );
  }
}
