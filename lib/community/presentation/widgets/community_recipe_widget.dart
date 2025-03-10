import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/core/routing/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../data/models/community_model.dart';
import '../manager/community_view_model.dart';
import 'community_recipe_details.dart';
import 'community_recipe_image.dart';
import 'community_recipe_user.dart';

class CommunityRecipeWidget extends StatelessWidget {
  const CommunityRecipeWidget(
      {super.key, required this.created, required this.model, required this.index});

  final CommunityModel model;

  final String created;
  final int index;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityTopViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CommunityRecipeUser(model: model, created: created),
        Container(
          height: 251,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 4,
            children: [
              GestureDetector(
                  onTap: () => context.go('${Routes.recipe_detail}/${vm.communityRecipes[index].id}'),
                  child: CommunityRecipeImage(model: model)),
              CommunityRecipeDetails(model: model)
            ],
          ),
        ),
        Divider(
          height: 1,
          color: AppColors.pinkSub,
        )
      ],
    );
  }
}
