import '../../../core/client.dart';
import '../../../recipe_detail/data/models/recipe_model.dart';
import '../models/recipe_model_small.dart';

class CategoriesDetailRepository {
  CategoriesDetailRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeModelSmall>> recipesByCategory = {};
  RecipeModel? recipe;

  Future<List<RecipeModelSmall>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null){
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesByCategory(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModelSmall.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeModel.fromJson(rawRecipe);
    return recipe!;
  }
}
