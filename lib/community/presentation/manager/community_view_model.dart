import 'package:flutter/material.dart';
import 'package:recipe_app_project1/community/data/models/community_model.dart';

import '../../../category_detail/data/repositories/recipe_repoitory.dart';

class CommunityTopViewModel extends ChangeNotifier {
  bool loading = true;

  final RecipeRepository _repo;

  int _index = 0;

  int get index => _index;

  set index(int index) {
    load(index: index);
    _index = index;
    notifyListeners();
  }

  List<CommunityModel> communityRecipes = [];

  CommunityTopViewModel({required RecipeRepository repo}) : _repo = repo {
    load(index: _index);
  }

  Future load({required int index}) async {
    loading = true;
    notifyListeners();
    List<CommunityModel> recipes = [];
    if (index == 0) {
      recipes = await _repo.fetchCommunityRecipes(null, order: "rating", descending: true, );
    } else if (index == 1) {
      recipes = await _repo.fetchCommunityRecipes(null, order: "date", descending: true);
    } else if (index == 2) {
      recipes = await _repo.fetchCommunityRecipes(null,
          order: "date", descending: false);
    }
    communityRecipes = recipes;

    loading = false;
    notifyListeners();
  }

  String sinceCreated({required CommunityModel model}) {
    DateTime now = DateTime.now();
    DateTime created = DateTime.parse(model.created);
    Duration diff = now.difference(created);

    if (diff.inDays >= 365) return "${(diff.inDays ~/ 365)} year${(diff.inDays ~/ 365) == 1 ? '' : 's'} ago";
    if (diff.inDays >= 30) return "${(diff.inDays ~/ 30)} month${(diff.inDays ~/ 30) == 1 ? '' : 's'} ago";
    if (diff.inDays >= 1) return "${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago";
    if (diff.inHours >= 1) return "${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago";
    if (diff.inMinutes >= 1) return "${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago";
    return "${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago";
  }

}
