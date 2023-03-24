import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
import 'package:drippe/models/recipe.dart';
import 'package:drippe/viewModels/recipe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final I10n _i10n = locator<I10n>();

class AddEditRecipeScreen extends ConsumerStatefulWidget {
  final List<Recipe> recipeList;
  final int? index;
  AddEditRecipeScreen(this.recipeList, {this.index});

  @override
  ConsumerState<AddEditRecipeScreen> createState() =>
      _AddEditRecipeScreenState();
}

class _AddEditRecipeScreenState extends ConsumerState<AddEditRecipeScreen> {
  TextEditingController ratioController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  TextEditingController grindController = TextEditingController();
  TextEditingController roastController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  String ratio = '16';
  String label = 'Normal';
  String grind = _i10n.mediumfine;
  String roast = _i10n.mediumroasts;
  String memo = '';

  void initEditRecipe() {
    if (widget.index != null) {
      ratio = widget.recipeList[widget.index!].ratio;
      label = widget.recipeList[widget.index!].label;
      grind = widget.recipeList[widget.index!].grind;
      roast = widget.recipeList[widget.index!].roast;
      memo = widget.recipeList[widget.index!].memo;

      ratioController.text = ratio.toString();
      labelController.text = label.toString();
      grindController.text = grind.toString();
      roastController.text = roast.toString();
      memoController.text = memo.toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initEditRecipe();
  }

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = ref.watch(recipeViewModelProvider.notifier);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        leading: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: Text(_i10n.cancel,
                style: const TextStyle(color: Colors.orange)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: Text(_i10n.save,
                  style: const TextStyle(color: Colors.orange)),
            ),
            onTap: () async {
              // 編集中の場合
              if (widget.index != null) {
                Recipe recipe = Recipe(
                  id: widget.recipeList[widget.index!].id,
                  ratio: ratio,
                  label: label,
                  grind: grind,
                  roast: roast,
                  memo: memo,
                );
                await recipeViewModel.updateRecipe(recipe);
              } else {
                // 追加の場合
                Recipe recipe = Recipe(
                  ratio: ratio,
                  label: label,
                  grind: grind,
                  roast: roast,
                  memo: memo,
                );
                await recipeViewModel.addRecipe(
                  recipe.label,
                  recipe.ratio,
                  recipe.grind,
                  recipe.roast,
                  recipe.memo,
                );
              }
              Navigator.pop(context);
            },
          )
        ],
        // backgroundColor: Colors.white,
        title: widget.index != null
            ? Text(_i10n.editRecipe)
            : Text(_i10n.addRecipe),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_i10n.label),
              const SizedBox(height: 10),
              TextField(
                controller: labelController,
                onChanged: (String value) {
                  label = value;
                },
                decoration: InputDecoration(
                  hintText: _i10n.labelHint,
                  suffixIcon: IconButton(
                    onPressed: () => labelController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(_i10n.ratioTitle),
              const SizedBox(height: 10),
              TextField(
                controller: ratioController,
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  ratio = value;
                },
                decoration: InputDecoration(
                  hintText: _i10n.stdRatio,
                  suffixIcon: IconButton(
                    onPressed: () => ratioController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(_i10n.beanCondition),
              const SizedBox(height: 10),
              DropdownButton(
                  value: grind,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 4,
                  // dropdownColor: Colors.white,
                  isExpanded: true,
                  underline: Container(
                    height: 0,
                  ),
                  items: <String>[
                    _i10n.turkish,
                    _i10n.fine,
                    _i10n.mediumfine,
                    _i10n.medium,
                    _i10n.mediumcoarse,
                    _i10n.coarse
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      grind = newValue!;
                    });
                  }),
              DropdownButton(
                  value: roast,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 4,
                  // dropdownColor: Colors.white,
                  isExpanded: true,
                  underline: Container(
                    height: 0,
                  ),
                  items: <String>[
                    _i10n.light,
                    _i10n.cinnamon,
                    _i10n.mediumroasts,
                    _i10n.high,
                    _i10n.city,
                    _i10n.french,
                    _i10n.italian
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      roast = newValue!;
                    });
                  }),
              const SizedBox(height: 40),
              Text(_i10n.memoTitle),
              const SizedBox(height: 10),
              TextField(
                controller: memoController,
                onChanged: (String value) {
                  memo = value;
                },
                decoration: InputDecoration(
                  hintText: _i10n.memoHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
