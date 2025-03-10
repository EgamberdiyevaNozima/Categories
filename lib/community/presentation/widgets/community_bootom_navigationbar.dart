import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_colors.dart';

import 'community_bottom_icon.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          // bottom: 40.h,
          // right: 0,
          // left: 0,
          child: BottomNavigationBarVanilla(),
        ),
      ],
    );
  }
}

class BottomNavigationBarVanilla extends StatelessWidget {
  const BottomNavigationBarVanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RecipeBottomIcon(
              onTap: () {
                context.go(Routes.homePage);
              },
              icon: "assets/icons/home.svg"),
          RecipeBottomIcon(
              onTap: () {
                context.push(Routes.community);
              },
              icon: "assets/icons/community.svg"),
          RecipeBottomIcon(
              onTap: () {
                context.push(Routes.categories);
              },
              icon: "assets/icons/categories.svg"),
          RecipeBottomIcon(
              onTap: () {
                context.push(Routes.meProfile);
              },
              icon: "assets/icons/profile.svg")
        ],
      ),
    );
  }
}
