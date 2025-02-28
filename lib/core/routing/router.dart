import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/core/routing/routes.dart';
import '../../categories/data/models/categories_model.dart';
import '../../categories/presentation/pages/categories_view.dart';
import '../../categories/presentation/pages/categories_view_model.dart';
import '../../categories_detail/data/models/recipe_model_small.dart';
import '../../categories_detail/presentation/pages/categories_detail_view.dart';
import '../../categories_detail/presentation/pages/categories_detail_view_model.dart';
import '../../recipe_detail/presentation/pages/recipe_detail_view.dart';
import '../../recipe_detail/presentation/pages/recipe_detail_view_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.categories,
  routes: [
    GoRoute(
      path: Routes.categories,
      builder: (context, state) {
        return CategoriesView(
          viewModel: CategoriesViewModel(repo: context.read()),
        );
      },
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => CategoriesDetailView(
        viewModel: CategoriesDetailViewModel(
          repo: context.read(),
          catsRepo: context.read(),
          selected: state.extra as CategoryModel,
        ),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => RecipeDetailView(
        viewModel: RecipeDetailViewModel(
          repo: context.read(),
          selected: state.extra as RecipeModelSmall,
          from: state.uri.queryParameters['from'] as String,
          // recipeRepo: context.read(),
          // recipeId: 1
        ),
      ),
    ),

  ],
);
