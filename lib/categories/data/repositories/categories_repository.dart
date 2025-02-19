
import '../../../core/client.dart';
import '../models/categories_model.dart';
class CategoriesRepository {
  CategoriesRepository({required this.client});

  final ApiClient client;
  List<CategoryModel> _categories = [];

  Future<List<CategoryModel>> fetchCategories({bool refresh = false}) async {
    if (_categories.isNotEmpty && !refresh) {
      return _categories;
    }

    List<dynamic> items = await client.fetchCategories();
    _categories = items.map((item) => CategoryModel.fromJson(item)).toList();
    return _categories;
  }
}
