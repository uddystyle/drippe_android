import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drippe/models/recipe.dart';

part 'recipe_state.freezed.dart';

@freezed
abstract class RecipeState with _$RecipeState {
  const factory RecipeState({
    @Default([]) List<Recipe> recipes,
  }) = _RecipeState;
}
