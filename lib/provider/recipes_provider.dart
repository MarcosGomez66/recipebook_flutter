import 'package:flutter/material.dart';
import 'package:recipe_book/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipes = [];

  Future<void> fetchRecipe() async {
    isLoading = true;
    notifyListeners();
    //puerto android 10.0.2.2
    //IOS 127.0.0.1
    final url = Uri.parse('http://192.168.100.84:3001/recipes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        recipes = List<Recipe>.from(data['recipes'].map((recipe) => Recipe.fromJSON(recipe)));
      } else {
        print('Error ${response.statusCode}');
        recipes = [];
      }
    } catch (e) {
      print('Error in request');
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(Recipe recipe) async {
    final isFavorite = favoriteRecipes.contains(recipe);

    try {
      final url = Uri.parse('http://192.168.100.84:3001/favorites');
      final response = isFavorite ? await http.delete(url, body: json.encode({'id': recipe.id})) :
          await http.post(url, body: json.encode(recipe.toJson()));
      if (response.statusCode == 200) {
        if (isFavorite) {
          favoriteRecipes.remove(recipe);
        } else {
          favoriteRecipes.add(recipe);
        }
        notifyListeners();
      } else {
        throw Exception('Failed to update favorite recipe');
      }
    } catch (e) {
      print('Error updating favorite recipes: $e');
    }
  }
}