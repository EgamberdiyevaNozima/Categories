import 'package:flutter/cupertino.dart';
import 'package:recipe_app_project1/category_detail/data/models/recipe_model.dart';
import 'package:recipe_app_project1/category_detail/data/repositories/recipe_repoitory.dart';
import '../../../categories/data/models/categories_model.dart';
import '../../../categories/data/repositories/category_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({required CategoryRepository repo,
  required RecipeRepository recipeRepo,
  }) : _repo = repo, _recipeRepo=recipeRepo{
    load();
  }
bool izLoading=true;
  final CategoryRepository _repo;
  final RecipeRepository _recipeRepo;

  List<CategoryModel> categories = [];

  late RecipeModel trendingRecipe;

  Future<void> load() async {
    izLoading=true;
    notifyListeners();
    try {
      categories = await _repo.fetchCategories();
      trendingRecipe=await _recipeRepo.fetchTrendingRecipe();
    } finally {
      izLoading=false;
      notifyListeners();
    }
  }
}
