import 'package:drippe/core/localization/generated/l10n.dart';
import 'package:drippe/locator.dart';
import 'package:drippe/viewModels/alarm_view_model.dart';
import 'package:drippe/viewModels/stopWatch_view_model.dart';
import 'package:drippe/viewModels/drippe_view_model.dart';
import 'package:drippe/viewModels/recipe_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double _kItemExtent = 32.0;
final I10n _i10n = locator<I10n>();

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

    var _screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SizedBox(
            width: _screenSize.width * 0.68,
            height: _screenSize.height * 0.15,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(_i10n.beans),
                        const Divider(),
                        Flexible(
                          child: TextFormField(
                            controller: beanController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              hintText: _i10n.input,
                              hintStyle: const TextStyle(fontSize: 16),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                            ),
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
                        Text(_i10n.water),
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
        ),
        const SizedBox(height: 32.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: Theme.of(context).cardColor,
          ),
          child: Text(
            recipeState.recipes.isEmpty
                ? _i10n.emptyRatio
                : '${_i10n.ratio} ${drippeState.ratio}',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        const SizedBox(height: 20.0),
        Text(stopWatchState.stopWatchTimeDisplay,
            style: const TextStyle(fontSize: 88, fontWeight: FontWeight.w200)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: stopWatchState.isStopPressed
                    ? stopWatchState.resetStopWatch
                    : stopWatchState.stopStopWatch,
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  fixedSize: const Size(80.0, 80.0),
                  backgroundColor: Theme.of(context).cardColor,
                ),
                child: Text(
                  stopWatchState.isStopPressed ? _i10n.reset : _i10n.stop,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              OutlinedButton(
                onPressed: stopWatchState.isStartPressed
                    ? stopWatchState.startStopWatch
                    : null,
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  fixedSize: const Size(80.0, 80.0),
                  backgroundColor: Theme.of(context).cardColor,
                ),
                child: Text(
                  _i10n.start,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
