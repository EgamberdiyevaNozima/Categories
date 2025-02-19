import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/onboarding/profile/presentation/widgets/profile_app_bar_bottom.dart';
import 'package:recipe_app_project1/onboarding/profile/presentation/widgets/profile_app_bar_title.dart';
import 'package:recipe_app_project1/onboarding/profile/presentation/widgets/recipe_circular_button.dart';
import '../../../../core/sizes.dart';
import '../pages/profile_view_model.dart';

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
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.topCenter,
            child: RecipeCircularButton(image: "assets/icons/burger_menu.svg", callback: () {}),
          ),
        ],
        bottom: ProfileAppBarBottom(),
      ),
    );
  }
}
