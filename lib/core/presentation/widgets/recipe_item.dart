import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/core/presentation/widgets/recipe_appbar_action.dart';
import 'package:profile/core/presentation/widgets/recipe_item_image.dart';
import 'package:profile/core/presentation/widgets/recipe_item_info.dart';
import '../../../categories_detail/data/models/recipe_model_small.dart';
import '../../colors.dart';
import '../../sizes.dart';

class Routes {
  static const String home = '/home';
  static const String recipeDetail = '/recipeDetail';
}


class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
    this.goBackRoute = Routes.home,
  });

  final RecipeModelSmall recipe;
  final String goBackRoute;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169 * AppSizes.wRatio,
        height: 226 * AppSizes.hRatio,
        child: GestureDetector(
          onTap: ()=> context.go('${Routes.recipeDetail}?from=$goBackRoute', extra: recipe),
          child: RecipeItemStack(recipe: recipe),
        ),
      ),
    );
  }
}

class RecipeItemStack extends StatelessWidget {
  const RecipeItemStack({
    super.key,
    required this.recipe,
  });

  final RecipeModelSmall recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: RecipeItemInfo(recipe: recipe),
        ),
        RecipeItemImage(image: recipe.image),
        Positioned(
          top: 7,
          right: 8,
          child: RecipeIconButtonContainer(
            image: 'assets/icons/heart.svg',
            iconColor: recipe.isLiked ? Colors.white : AppColors.pinkSub,
            containerColor: recipe.isLiked ? AppColors.redPinkMain : AppColors.pink,
            callback: () {},
          ),
        ),
      ],
    );
  }
}
