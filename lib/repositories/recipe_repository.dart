import 'package:drippe/databases/recipe_database.dart';
import 'package:drippe/models/recipe.dart';

class RecipeRepository {
  final RecipeDatabase _recipeDatabase;

  RecipeRepository(this._recipeDatabase);

  Future<List<Recipe>> getRecipe() async {
    return _recipeDatabase.getRecipe();
  }

  Future<Recipe> addRecipe(Recipe recipe) async {
    return _recipeDatabase.insert(recipe);
  }

  Future<void> updateRecipe(Recipe recipe) async {
    return _recipeDatabase.update(recipe);
  }

  Future<void> deleteRecipe(int id) async {
    return _recipeDatabase.delete(id);
  }
}
