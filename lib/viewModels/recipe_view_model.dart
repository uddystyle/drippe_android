import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drippe/models/recipe.dart';
import 'package:drippe/databases/recipe_database.dart';
import 'package:drippe/repositories/recipe_repository.dart';
import 'package:drippe/states/recipe_state.dart';

final recipeViewModelProvider = StateNotifierProvider(
  (ref) => RecipeViewModelProvider(
    RecipeRepository(RecipeDatabase()),
  ),
);

class RecipeViewModelProvider extends StateNotifier<RecipeState> {
  RecipeViewModelProvider(this._recipeRepository) : super(const RecipeState()) {
    getRecipe();
  }

  final RecipeRepository _recipeRepository;

  Future<void> addRecipe(String label, String ratio, String grind, String roast,
      String memo) async {
    final recipe = await _recipeRepository.addRecipe(Recipe(
      label: label,
      ratio: ratio,
      grind: grind,
      roast: roast,
      memo: memo,
    ));

    state = state.copyWith(
      recipes: [recipe, ...state.recipes],
    );
  }

  Future<void> updateRecipe(Recipe recipe) async {
    final newRecipe = recipe.copyWith(
      label: recipe.label,
      ratio: recipe.ratio,
      grind: recipe.grind,
      roast: recipe.roast,
      memo: recipe.memo,
    );

    await _recipeRepository.updateRecipe(recipe);
    final newRecipes =
        state.recipes.map((e) => e.id == newRecipe.id ? newRecipe : e).toList();

    state = state.copyWith(
      recipes: newRecipes,
    );
  }

  Future<void> getRecipe() async {
    final recipes = await _recipeRepository.getRecipe();

    state = state.copyWith(
      recipes: recipes,
    );
  }

  Future<void> deleteRecipe(int recipeId) async {
    await _recipeRepository.deleteRecipe(recipeId);

    final recipes =
        state.recipes.where((recipe) => recipe.id != recipeId).toList();

    state = state.copyWith(
      recipes: recipes,
    );
  }
}
