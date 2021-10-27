import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class RecipeGridsView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  RecipeGridsView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final SimpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: SimpleRecipe);
        },
      ),
    );
  }
}
