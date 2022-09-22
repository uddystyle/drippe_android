import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final drippeViewModelProvider =
    ChangeNotifierProvider((ref) => DrippeViewModel());

class DrippeViewModel extends ChangeNotifier {
  String ratio = '16';
  String bean = "";
  int index = 0;

  void setRatio(String selectedRatio) {
    ratio = selectedRatio;
    notifyListeners();
  }

  void setBean(String selectedBean) {
    bean = selectedBean;
    notifyListeners();
  }

  void setIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }

  Future<void> save(key, text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, text);
  }
}
