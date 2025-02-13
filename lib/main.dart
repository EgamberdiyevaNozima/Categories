import 'package:flutter/material.dart';
import 'package:profile/categories/data/repositories/categories_repository.dart';
import 'package:profile/categories/presentation/pages/categories_view.dart';
import 'package:profile/categories/presentation/pages/categories_view_model.dart';
import 'package:profile/core/client.dart';
import 'package:profile/core/sizes.dart';
import 'package:profile/onboarding/data/repositories/onboarding_repositories.dart';
import 'package:profile/onboarding/presentation/managers/onboarding_view_model.dart';
import 'package:profile/onboarding/presentation/pages/onboarding_view.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      home: CategoriesView(
        viewModel: CategoriesViewModel(
          repo:CategoriesRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}
