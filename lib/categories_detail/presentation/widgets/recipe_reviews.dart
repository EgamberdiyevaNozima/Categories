import 'package:flutter/material.dart';
import 'package:recipe_app_project1/categories_detail/presentation/widgets/recipe_svg_image.dart';
class RecipeReview extends StatelessWidget {
  const RecipeReview({
    super.key,
    required this.reviews,
  });

  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RecipeSvgImage(
          image: "assets/icons/reviews.svg",
          width: 10,
          height: 10,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text(
          reviews.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
