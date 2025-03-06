import 'package:flutter/material.dart';
import 'package:recipe_app_project1/recipe_detail/presentation/widgets/recipe_detail_main_text.dart';

import '../../../category_detail/presentation/widgets/recipe_time.dart';
import '../../../core/utils/app_colors.dart';
import '../manager/recipe_detail_view_model.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 15,
          children: [
            RecipeDetailMainText(text: 'Details'),
            RecipeTime(
              timeRequired: vm.recipe.timeRequired,
              color: AppColors.milkWhite,
            ),
          ],
        ),
        Text(
          vm.recipe.description,
          style: TextStyle(
            color: AppColors.milkWhite,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
