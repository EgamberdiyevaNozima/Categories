import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recipe_app_project1/profile/presentation/pages/profile_body_recipe.dart';
import 'package:recipe_app_project1/profile/presentation/pages/profile_view_model.dart';

import '../../../core/utils/app_colors.dart';
import '../widgets/profile_page_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.beigeColor,
          appBar: ProfilePageAppBar(vm: vm),
          body: TabBarView(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                ),
                itemCount: vm.myRecipe!.length,
                itemBuilder: (context, index) {
                  return profile_body_recipe(
                    photo: vm.myRecipe![index].photo,
                    title: vm.myRecipe![index].title,
                    description: vm.myRecipe![index].description,
                    time: vm.myRecipe![index].timeRequired,
                    rating: vm.myRecipe![index].rating,
                  );
                },
              ),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
=======
import 'package:profile/core/client.dart';
import 'package:profile/profile/data/repositories/profile_repository.dart';

import 'package:profile/profile/presentation/pages/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_page_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(
        profileRepo: ProfileRepository(
          client: ApiClient(),
        ),
      ),
      child: ProfilePageContent(),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ProfileViewModel>();

    return switch (vm.loading) {
      true => Center(child: CircularProgressIndicator()),
      false => DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xFF1C0F0D),
            appBar: ProfilePageAppBar(),
            body: TabBarView(
              children: [
                Text(
                  "Birinchi page",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Ikkinchi page",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
    };
  }
}
>>>>>>> origin/main
