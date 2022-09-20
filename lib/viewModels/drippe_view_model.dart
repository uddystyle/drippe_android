import 'package:drippe/models/stop_watch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _beanAmountProvider = StateProvider<String>((ref) => "0");
final _ratioProvider = StateProvider<String>((ref) => "16");
final _indexProvider = StateProvider<int>((ref) => 0);

final stopWatchProvider = ChangeNotifierProvider((ref) => StopWatchModel());

class DrippeViewModel {
  late final WidgetRef _ref;
  // final prefs = SharedPreferences.getInstance();
  // final SoundLogic _soundLogic = SoundLogic();

  String get beanAmount => _ref.watch(_beanAmountProvider);
  String get ratio => _ref.watch(_ratioProvider);
  int get index => _ref.watch(_indexProvider);
  // int get waterAmount => int.parse(beanAmount) * int.parse(ratio);

  void setRef(WidgetRef ref) {
    _ref = ref;
    // _soundLogic.load();
  }

  void onBeanAmountChanged(String beanAmount) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _ref.read(_beanAmountProvider.notifier).update((state) => beanAmount);
    // String newBean = _ref.watch(_beanAmountProvider);
    // sharedPreferences.setString('beanAmount', newBean);
  }

  void onRatioChanged(String ratio) {
    _ref.read(_ratioProvider.notifier).update((state) => ratio);
  }

  void onIndexChanged(int index) {
    _ref.read(_indexProvider.notifier).update((state) => index);
  }

  Future<void> save(key, text) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(key, text);
  }
}
