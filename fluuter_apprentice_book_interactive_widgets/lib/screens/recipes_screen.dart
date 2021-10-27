import 'package:flutter/material.dart';

import '../models/models.dart';
import '../components/components.dart';
import '../api/mock_fooderlich_service.dart';

class RecipesScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getRecipes(),
        builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data ?? [];
            //TODO: Add RecipeGridsView Here
            return RecipeGridsView(recipes: recipes);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
