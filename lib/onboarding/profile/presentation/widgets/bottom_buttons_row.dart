import 'package:flutter/material.dart';

import 'recipe_elevated_button.dart';


class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RecipeElevatedButton(text: "Edit Profile", callback: () {},size: Size(50, 50),),
        RecipeElevatedButton(text: "Share Profile", callback: () {},size: Size(50, 50),),
      ],
    );
  }
}
