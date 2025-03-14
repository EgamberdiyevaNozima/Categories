import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/core/presentation/widgets/recipe_appbar_action.dart';
import 'package:profile/core/presentation/widgets/recipe_icon_button.dart';
import 'package:provider/provider.dart';
import '../../colors.dart';
import '../../sizes.dart';
import '../../utils/styles.dart';

class RecipeAppbarDetail extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppbarDetail({
    super.key,
    required this.title,
    required this.goBackRoute,
  });

  final String title;
  final String goBackRoute;

  @override
  Size get preferredSize => const Size(double.infinity, 61);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38),
      child: AppBar(
        toolbarHeight: 61,
        leadingWidth: 20,
        leading: RecipeIconButton(
          callback: ()=> context.go(goBackRoute),
          image: "assets/icons/back-arrow.svg",
          width: 30,
          height: 14,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.appBarTitleStyle,
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/heart.svg",
            iconColor: AppColors.pinkSub,
            iconWidth: 16,
            iconHeight: 16,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/share.svg",
            iconColor: AppColors.pinkSub,
            iconWidth: 16,
            iconHeight: 16,
            callback: () {},
          )
        ],
      ),
    );
  }
}
