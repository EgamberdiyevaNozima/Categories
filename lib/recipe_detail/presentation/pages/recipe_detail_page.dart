import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app_project1/core/routing/routes.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../login/presentation/widgets/login_appbar_widget.dart';
import '../manager/recipe_detail_view_model.dart';
import '../widgets/details_widget.dart';
import '../widgets/food_widget.dart';
import '../widgets/recipe_detail_main_text.dart';
import '../widgets/recipe_detail_user_widget.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key, required this.recipeId});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBarWidget(
        title: "Chicken Curry",
        leading: "assets/icons/back-arrow.svg",
        firstAction: "assets/icons/heart.svg",
        secondAction: "assets/icons/share.svg", leadingCallBack: () { context.go(Routes.community);},
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 20, left: 20, top: 26, bottom: 120),
        children: [
          FoodWidget(vm: vm),
          SizedBox(height: 26),
          RecipeDetailUserWidget(vm: vm),
          SizedBox(height: 20),
          Container(
            height: 2,
            decoration: BoxDecoration(color: AppColors.pinkSub),
          ),
          SizedBox(height: 19),
          DetailsWidget(vm: vm),
          SizedBox(height: 31),
          RecipeDetailMainText(text: "Ingredient"),
          Column(children: vm.getIngredient()),
          SizedBox(height: 31),
          RecipeDetailMainText(
              text: "${vm.recipe.instructions.length} Easy Steps"),
          Column(
            children: vm.getInstructions(),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
