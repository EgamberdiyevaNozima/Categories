import 'package:flutter/material.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/repositories/categories_repository.dart';
import '../../data/models/recipe_model_small.dart';
import '../../data/repositories/categories_detail_repository.dart';

class CategoriesDetailViewModel extends ChangeNotifier {
  CategoriesDetailViewModel({
    required CategoriesDetailRepository repo,
    required CategoriesRepository catsRepo,
    required this.selected,
  })  : _repo = repo,
        _catsRepo = catsRepo{
    load();
  }

  final CategoriesDetailRepository _repo;
  final CategoriesRepository _catsRepo;

  List<RecipeModelSmall> recipes = [];
  List<CategoryModel> categories = [];

  final CategoryModel selected;


  Future<void> load() async {
    try {
      categories = await _catsRepo.fetchCategories();
      recipes = await _repo.fetchRecipes(selected.id);
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadRefresh() async {
    try {
      categories = await _catsRepo.fetchCategories(refresh: true);
      recipes = await _repo.fetchRecipes(selected.id);
    } finally {
      notifyListeners();
    }
  }
}