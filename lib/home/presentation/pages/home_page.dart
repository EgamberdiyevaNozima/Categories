import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/home/presentation/pages/top_chef.dart';
import 'package:recipe_app_project1/home/presentation/pages/trending_recipe_widget.dart';
import 'package:recipe_app_project1/home/presentation/pages/your_recipes_widget.dart';

import 'home_page_app_bar.dart';
import 'home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});


  @override
  Widget build(BuildContext context) {

    final viewModel=context.watch <HomePageViewModel>();

    if(viewModel.izLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    return Scaffold(
      appBar: HomePageAppBar(),
      body: ListView(
        children: [
          TrendingRecipeWidget(recipe: viewModel.trendingRecipe, ),
          SizedBox(height: 19),
          YourRecipesWidget(recipe: viewModel.trendingRecipe,),
          SizedBox(height: 19),
          TopChef(recipe: viewModel.trendingRecipe,)
        ],
      ),
    );
  }
}
