import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final testViewModelProvider = ChangeNotifierProvider((ref) => TestViewModel());

class TestViewModel extends ChangeNotifier {
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
}
