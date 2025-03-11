import 'package:flutter/material.dart';
<<<<<<< HEAD


import '../../data/models/profile_model.dart';
import '../../data/models/recipes_model.dart';
import '../../data/repositories/profile_repository.dart';
import '../../data/repositories/recipes_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required this.recipeRepo, required this.profileRepo}) {
    load();
  }

  final BodyRecipesRepo recipeRepo;
  final ProfileRepository profileRepo;
  ProfileModel? myProfile;
  List<RecipesModel>? myRecipe;

  Future load() async {
    myProfile = await profileRepo.fetchMyProfile();
    myRecipe = await recipeRepo.fetchRecipes();
=======
import 'package:profile/profile/data/models/profile_model.dart';
import 'package:profile/profile/data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({
    required ProfileRepository profileRepo,
  }) : _profileRepo = profileRepo {
    load();
  }

  bool loading = true;

  final ProfileRepository _profileRepo;
  late ProfileModel myProfile;

  Future load() async {
    loading = true;
    notifyListeners();

    myProfile = await _profileRepo.fetchMyProfile();
    loading = false;
>>>>>>> origin/main
    notifyListeners();
  }
}
