import 'package:flutter/material.dart';
import 'package:recipe_app_project1/core/colors.dart';

import 'categories/data/repositories/categories_repository.dart';
import 'categories/presentation/pages/categories_view.dart';
import 'categories/presentation/pages/categories_view_model.dart';
import 'core/client.dart';
import 'core/sizes.dart';
import 'onboarding/data/repositories/onboarding_repositories.dart';
import 'onboarding/presentation/managers/onboarding_view_model.dart';
import 'onboarding/presentation/pages/onboarding_view.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  ProfileApp({super.key});

  final darkTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.redPinkMain,
        onPrimary: Colors.white,
        secondary: AppColors.pink,
        onSecondary: AppColors.pinkSub,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.beigeColor,
        onSurface: AppColors.redPinkMain
    ),
  );

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      theme: darkTheme,
      home: CategoriesView(
        viewModel: CategoriesViewModel(
          repo: CategoriesRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}
