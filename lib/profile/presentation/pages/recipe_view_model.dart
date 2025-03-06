import 'package:flutter/cupertino.dart';

import '../../data/models/recipes_model.dart';
import '../../data/repositories/recipes_repository.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeViewModel({required BodyRecipesRepo recipeRepo})
      : _recipeRepo = recipeRepo {
    load();
  }

  final BodyRecipesRepo _recipeRepo;
  List<RecipesModel>? myRecipe;

  Future<void> load() async {
    myRecipe = await _recipeRepo.fetchRecipes();
    notifyListeners();
  }
}
