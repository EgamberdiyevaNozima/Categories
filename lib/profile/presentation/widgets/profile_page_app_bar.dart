import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recipe_app_project1/profile/presentation/widgets/profile_appbar_action_container.dart';
import 'package:recipe_app_project1/profile/presentation/widgets/profile_appbar_bottom.dart';
import 'package:recipe_app_project1/profile/presentation/widgets/profile_appbar_leading.dart';
import 'package:recipe_app_project1/profile/presentation/widgets/profile_appbar_title.dart';

import '../../../core/sizes.dart';
import '../../../core/utils/app_colors.dart';
import '../pages/profile_view_model.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfilePageAppBar({
    super.key,
    required this.vm,
  });

  @override
  Size get preferredSize => Size(double.infinity, 245 * AppSizes.hRatio);

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: AppBar(
        leadingWidth: 102 * AppSizes.wRatio,
        toolbarHeight: 102 * AppSizes.hRatio,
        backgroundColor: AppColors.beigeColor,
        leading: profile_appbar_leading(vm: vm),
        title: profile_appbar_title(vm: vm),
        actions: [
          Align(
            child: AppBarActionContainer(
              svg: "assets/icons/plus.svg",
              callback: () {},
            ),
            alignment: Alignment.topCenter,
=======
import 'package:profile/core/sizes.dart';
import 'package:profile/profile/presentation/widgets/profile_app_bar_bottom.dart';
import 'package:profile/profile/presentation/widgets/profile_app_bar_title.dart';
import 'package:profile/profile/presentation/pages/profile_view_model.dart';
import 'package:profile/profile/presentation/widgets/recipe_circular_button.dart';
import 'package:provider/provider.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfilePageAppBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 240 * AppSizes.hRatio);

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ProfileViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: AppBar(
        backgroundColor: Color(0xFF1C0F0D),
        leadingWidth: 102 * AppSizes.wRatio,
        toolbarHeight: 102 * AppSizes.hRatio,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(51),
          child: Image.network(vm.myProfile.image),
        ),
        title: ProfileAppBarTitle(),
        actions: [
          Align(
            alignment: Alignment.topCenter,
            child: RecipeCircularButton(image: "assets/icons/plus.svg", callback: () {}),
>>>>>>> origin/main
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.topCenter,
<<<<<<< HEAD
            child: AppBarActionContainer(
              svg: "assets/icons/categories.svg",
              callback: () {},
            ),
          ),
        ],
        bottom: profile_appbar_bottom(vm: vm),
=======
            child: RecipeCircularButton(image: "assets/icons/burger_menu.svg", callback: () {}),
          ),
        ],
        bottom: ProfileAppBarBottom(),
>>>>>>> origin/main
      ),
    );
  }
}
