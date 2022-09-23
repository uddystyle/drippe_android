import 'package:drippe/viewModels/alarm_view_model.dart';
import 'package:drippe/viewModels/stopWatch_view_model.dart';
import 'package:drippe/viewModels/drippe_view_model.dart';
import 'package:drippe/viewModels/recipe_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const double _kItemExtent = 32.0;

class DrippeScreen extends HookConsumerWidget {
  final beanController = TextEditingController();

  int get waterAmount => int.parse(beanController.text) * int.parse(ratio);
  int _selectedIndex = 0;
  String ratio = '16';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   AlarmProvider.setDb();
    //   final prefs = SharedPreferences.getInstance();
    //   _selectedIndex = prefs.getInt('index')!;
    //   return null;
    // }, const []);

    useEffect(() {
      Future<void>.microtask(() async {
        AlarmProvider.setDb();
      });
      return null;
    }, const []);

    return Scaffold(
      body: _drippeScreen(context, ref),
    );
  }

  void _showDialog(WidgetRef ref, BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  Widget _drippeScreen(context, ref) {
    final recipeState = ref.watch(recipeViewModelProvider);
    final drippeState = ref.watch(drippeViewModelProvider);
    final stopWatchState = ref.watch(stopWatchProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: SizedBox(
            width: 240,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('珈琲豆(g)'),
                      const Divider(),
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                          ),
                          controller: beanController,
                          onChanged: (String value) {
                            drippeState.setBean(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("抽出量(g)"),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          recipeState.recipes.isEmpty ||
                                  beanController.text.isEmpty
                              ? "0"
                              : "$waterAmount",
                          // : "0",
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        OutlinedButton(
          onPressed: () => _showDialog(
            ref,
            context,
            CupertinoPicker(
              scrollController:
                  FixedExtentScrollController(initialItem: _selectedIndex),
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: _kItemExtent,
              onSelectedItemChanged: (int selectedItem) {
                // 選択されたインデックスが返ってくる
                _selectedIndex = selectedItem;
                drippeState.setIndex(_selectedIndex);
                ratio = recipeState.recipes[drippeState.index].ratio;
                drippeState.setRatio(ratio);
              },
              children: List<Widget>.generate(recipeState.recipes.length,
                  (int index) {
                return Center(
                  child: Text(
                    "${recipeState.recipes[index].label}: ${recipeState.recipes[index].ratio}",
                    style: TextStyle(
                        color: Theme.of(context).toggleableActiveColor),
                  ),
                );
              }),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            recipeState.recipes.isEmpty
                ? 'レシピを作成してください'
                : '比率 ${drippeState.ratio}',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        const SizedBox(height: 20.0),
        Text(stopWatchState.stopWatchTimeDisplay,
            style: const TextStyle(fontSize: 88, fontWeight: FontWeight.w200)),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: stopWatchState.isStopPressed
                    ? stopWatchState.resetStopWatch
                    : stopWatchState.stopStopWatch,
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(32)),
                child: Text(
                  stopWatchState.isStopPressed ? "リセット" : "ストップ",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              OutlinedButton(
                onPressed: stopWatchState.isStartPressed
                    ? stopWatchState.startStopWatch
                    : null,
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(32)),
                child: Text(
                  "スタート",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
