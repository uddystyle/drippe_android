import 'package:drippe/databases/app_recipe_database.dart';
import 'package:drippe/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecipeDatabase extends AppRecipeDatabase {
  final String _tableName = 'recipe';

  Future<List<Recipe>> getRecipe() async {
    final db = await database;
    final maps = await db.query(_tableName);

    if (maps.isEmpty) return [];

    return maps.map((map) => Recipe.fromJson(map)).toList();
  }

  Future<Recipe> insert(Recipe recipe) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      recipe.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return recipe.copyWith(
      id: id,
    );
  }

  Future update(Recipe recipe) async {
    final db = await database;

    return await db.update(
      _tableName,
      recipe.toJson(),
      where: 'id = ?',
      whereArgs: [recipe.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(int id) async {
    final db = await database;

    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
