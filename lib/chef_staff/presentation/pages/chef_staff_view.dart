import 'package:flutter/material.dart';
import 'package:recipe_app_project1/chef_staff/presentation/pages/profile_scaffold_tab_bar.dart';
import '../../../core/presentations/bottom_navigation_bar.dart';
import '../../../core/utils.dart';
import '../widgets/chef_staff_app_bar.dart';
import 'chef_staff_view_model.dart';

class ChefStaffView extends StatelessWidget {
  const ChefStaffView({super.key, required this.vm});

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => DefaultTabController(
          length: 2,
          child: switch (vm.loading) {
            true => Center(child: CircularProgressIndicator()),
            false => ProfileScaffold(vm: vm)
          }),
    );
  }
}

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({super.key, required this.vm});
  final ChefStaffViewModel vm;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.mainBackgroundColor,
        appBar: ChefStaffAppBarBody(vm: vm),
        body: (vm.recipeModel != null && vm.recipeModel!.isNotEmpty)
            ? ProfileScaffoldTabBar(vm: vm)
            : Center(child: Text("Data not found")),
        bottomNavigationBar:
            Padding(
              padding: const EdgeInsets.only(bottom: 50,left: 36,right: 36),
              child: BottomNavBarItem(),
            ),
      ),
    );
  }
}
