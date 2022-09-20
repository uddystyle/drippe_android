import 'package:drippe/models/recipe.dart';
import 'package:drippe/viewModels/recipe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  String ratio = '16';
  String label = 'ふつう';
  String grind = '中細挽き';
  String roast = 'ミディアムロースト';

  void initEditRecipe() {
    if (widget.index != null) {
      ratio = widget.recipeList[widget.index!].ratio;
      label = widget.recipeList[widget.index!].label;
      grind = widget.recipeList[widget.index!].grind;
      roast = widget.recipeList[widget.index!].roast;

      ratioController.text = ratio.toString();
      labelController.text = label.toString();
      grindController.text = grind.toString();
      roastController.text = roast.toString();
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
            child: const Text('キャンセル', style: TextStyle(color: Colors.orange)),
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
              child: const Text('保存', style: TextStyle(color: Colors.orange)),
            ),
            onTap: () async {
              // 編集中の場合
              if (widget.index != null) {
                Recipe recipe = Recipe(
                    id: widget.recipeList[widget.index!].id,
                    ratio: ratio,
                    label: label,
                    grind: grind,
                    roast: roast);
                await recipeViewModel.updateRecipe(recipe);
              } else {
                // 追加の場合
                Recipe recipe = Recipe(
                    ratio: ratio, label: label, grind: grind, roast: roast);
                await recipeViewModel.addRecipe(
                    recipe.label, recipe.ratio, recipe.grind, recipe.roast);
              }
              Navigator.pop(context);
            },
          )
        ],
        // backgroundColor: Colors.white,
        title: widget.index != null ? Text("レシピを編集") : Text("レシピを追加"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ラベル"),
              const SizedBox(height: 10),
              TextField(
                controller: TextEditingController(text: label),
                onChanged: (String value) {
                  label = value;
                },
              ),
              const SizedBox(height: 40),
              Text("豆とお湯の比率"),
              const SizedBox(height: 10),
              TextField(
                controller: TextEditingController(text: ratio),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  ratio = value;
                },
              ),
              const SizedBox(height: 40),
              Text("豆の状態"),
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
                  items: <String>['極細挽き', '細挽き', '中細挽き', '中挽き', '中粗挽き', '粗挽き']
                      .map<DropdownMenuItem<String>>((String value) {
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
                    'ライトロースト',
                    'シナモンロースト',
                    'ミディアムロースト',
                    'ハイロースト',
                    'シティロースト',
                    'フレンチロースト',
                    'イタリアンロースト'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      roast = newValue!;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
