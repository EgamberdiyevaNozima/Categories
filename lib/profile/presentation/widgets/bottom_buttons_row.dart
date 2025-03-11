import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recipe_app_project1/profile/presentation/widgets/profile_elevated_button.dart';

class bottom_buttons_row extends StatelessWidget {
  const bottom_buttons_row({
=======

import 'recipe_elevated_button.dart';


class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({
>>>>>>> origin/main
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
<<<<<<< HEAD
        profile_elevated_button(text: 'Edit Profile'),
        profile_elevated_button(text: 'Share Profile'),
=======
        RecipeElevatedButton(text: "Edit Profile", callback: () {}),
        RecipeElevatedButton(text: "Share Profile", callback: () {}),
>>>>>>> origin/main
      ],
    );
  }
}
