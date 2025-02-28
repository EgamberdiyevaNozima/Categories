import 'package:flutter/material.dart';
import '../../../categories_detail/presentation/widgets/recipe_time.dart';
import '../../../core/styles.dart';

class RecipeDetailDetailsSection extends StatelessWidget {
  const RecipeDetailDetailsSection({
    super.key,
    required this.timeRequired,
    required this.description,
  });

  final String description;
  final int timeRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "Details",
              style: TextStyles.recipeSectionTitle,
            ),
            SizedBox(width: 15),
            RecipeTime(
              time: timeRequired,
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
          ],
        ),
        Text(
          description,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
