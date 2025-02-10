
import 'package:flutter/material.dart';

import '../../data/models/onboarding_page_model.dart';
import '../../data/repositories/onboarding_page_repository.dart';
class OnboardingViewModel  extends ChangeNotifier{
  OnboardingViewModel({ required OnboardingRepository repo}) : _repo = repo{
    load();
  }

  final OnboardingRepository _repo;

  List<OnboardingPageModel> pages = [];

  Future<void> load() async{
    pages = await _repo.fetchOnboardingPages();
    notifyListeners();
  }
}