import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/provider/recipes_provider.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/screens/recipe_detail.dart';

class FavoritesRecipes extends StatelessWidget {
  const FavoritesRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RecipesProvider>(
        builder: (context, recipeProvider, child) {
          final favoritesRecipes = recipeProvider.favoriteRecipes;
          return favoritesRecipes.isEmpty
              ? Center(child: Text('No favorites recipes'))
              : ListView.builder(
                  itemCount: favoritesRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = favoritesRecipes[index];
                    return FavoriteRecipeCard(recipe: recipe);
                  },
                );
        },
      ),
    );
  }
}

class FavoriteRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const FavoriteRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipesData: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(recipe.imageLink, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recipe.name,
                      style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                    ),
                    Container(height: 1, width: 75, color: Colors.orange),
                    SizedBox(height: 6),
                    Text(recipe.author),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
