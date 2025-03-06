import 'package:flutter/cupertino.dart';
import '../../../categories/data/models/categories_model.dart';
import '../../../categories/data/repositories/category_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({required CategoryRepository repo}) : _repo = repo {
    load();
  }

  final CategoryRepository _repo;

  List<CategoryModel> categories = [];

  Future<void> load() async {
    try {
      categories = await _repo.fetchCategories();
    } finally {
      notifyListeners();
    }
  }
}
