import 'package:flutter/material.dart';

import 'package:recipe_app_project1/home/presentation/pages/trending_recipe_widget.dart';
import 'package:recipe_app_project1/home/presentation/pages/your_recipes_widget.dart';

import 'home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: ListView(
        children: [
          TrendingRecipeWidget(),
          SizedBox(height: 19),
          YourRecipesWidget(),
        ],
      ),
    );
  }
}
