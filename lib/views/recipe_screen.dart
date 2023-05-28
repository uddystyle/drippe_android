import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
import 'package:drippe/viewModels/recipe_view_model.dart';
import 'package:drippe/views/add_edit_recipe_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:path/path.dart';

final I10n _i10n = locator<I10n>();

class RecipeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _recipeList(context, ref),
    );
  }

  Widget _recipeList(context, ref) {
    final recipeViewModel = ref.watch(recipeViewModelProvider.notifier);
    final recipeState = ref.watch(recipeViewModelProvider);

    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            // AppLocalizations.of(context)!.recipeTitle,
            _i10n.recipeTitle,
            style: Theme.of(context).textTheme.headline4,
          ),
          trailing: GestureDetector(
            child: const Icon(Icons.add, color: Colors.orange),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddEditRecipeScreen(recipeState.recipes)));
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recipe = recipeState.recipes[index];
              return Column(
                children: [
                  Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) async {
                            await recipeViewModel.deleteRecipe(recipe.id);
                          },
                          // label: AppLocalizations.of(context)!.delete,
                          label: _i10n.delete,
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recipe.label),
                            Row(
                              children: [
                                Text(recipe.grind),
                                const SizedBox(width: 10),
                                Text(recipe.roast),
                              ],
                            ),
                            Text(recipe.memo),
                          ],
                        ),
                        trailing: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                recipe.ratio,
                                style: const TextStyle(fontSize: 32),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditRecipeScreen(
                                  recipeState.recipes,
                                  index: index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            childCount: recipeState.recipes.length,
          ),
        ),
      ],
    );
  }
}
