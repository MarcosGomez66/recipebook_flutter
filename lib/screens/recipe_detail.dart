import 'package:flutter/material.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:recipe_book/provider/recipes_provider.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipesData;
  const RecipeDetail({super.key, required this.recipesData});

  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<RecipesProvider>(context);
    final isFavorite = recipesProvider.favoriteRecipes.contains(recipesData);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipesData.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              recipesProvider.toggleFavoriteStatus(recipesData);
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                key: ValueKey<bool>(isFavorite),
                color: isFavorite ? Colors.red : Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipesData.imageLink),
            Text(recipesData.name),
            Text('by: ${recipesData.author}'),
            SizedBox(height: 10),
            Text('Steps:', style: TextStyle(fontWeight: FontWeight.bold)),
            for (var step in recipesData.recipeSteps) Text('- $step'),
          ],
        ),
      ),
    );
  }
}
