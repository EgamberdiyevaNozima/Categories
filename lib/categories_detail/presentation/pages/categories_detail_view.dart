import 'package:flutter/material.dart';
import '../../../core/sizes.dart';
import '../../data/models/recipe_model_small.dart';
import '../widgets/recipe_appbar_catdetail.dart';
import '../widgets/recipe_bottom_navigator.dart';
import '../widgets/recipe_item.dart';
import 'package:recipe_app_project1/core/sizes.dart' as CoreSizes;
import 'package:recipe_app_project1/categories_detail/presentation/widgets/recipe_bottom_navigator.dart' as BottomNavSizes;

import 'categories_detail_view_model.dart';
import 'package:recipe_app_project1/categories_detail/presentation/widgets/recipe_bottom_navigator.dart' hide AppSizes;
import 'package:recipe_app_project1/core/sizes.dart';

class CategoriesDetailView extends StatelessWidget {
  const CategoriesDetailView({
    super.key,
    required this.viewModel,
  });

  final CategoriesDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => viewModel.loadRefresh(),
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) => Scaffold(
          extendBody: true,
          appBar: RecipeAppbarCatDetail(
            title: viewModel.selected.title,
            categories: viewModel.categories,
            selected: viewModel.selected,
          ),
          body: CategoriesDetailBody(recipes: viewModel.recipes),
          bottomNavigationBar: RecipeBottomNavigationBar(),
        ),
      ),
    );
  }
}

class CategoriesDetailBody extends StatelessWidget {
  const CategoriesDetailBody({
    super.key,
    required this.recipes,
  });

  final List<RecipeModelSmall> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 169 / 226,
          mainAxisSpacing: 10
      ),
      itemCount: recipes.length,
      padding: EdgeInsets.fromLTRB(CoreSizes.AppSizes.padding38, 10, CoreSizes.AppSizes.padding38, 100),
      itemBuilder: (context, index) => RecipeItem(recipe: recipes[index]),
    );
  }
}
