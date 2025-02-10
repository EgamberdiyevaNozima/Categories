import 'package:flutter/cupertino.dart';
import '../../data/models/chef_stuff_model.dart';
import '../../data/models/recipe_model.dart';
import '../../data/repositories/chef_staff_repository.dart';

class ChefStaffViewModel extends ChangeNotifier {
  ChefStaffViewModel({required ChefStaffRepository repo}) : _repo = repo {
    load();
  }

  ChefStuffModel? model;
   List<RecipeModel>? recipeModel;
  final ChefStaffRepository _repo;
  bool loading = true;
  Future<void> load() async {
    loading = true;
    notifyListeners();
    model = await _repo.fetchUser();
    recipeModel = await _repo.fetchRecipe();
    loading = false;
    notifyListeners();
  }
}




