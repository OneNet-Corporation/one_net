import 'package:flutter/material.dart';

class BottomMenuBarProvider extends ChangeNotifier {
  bool _isBusy = false;
  bool get isbusy => _isBusy;
  set isBusy(bool value) {
    if (value != _isBusy) {
      _isBusy = value;
      notifyListeners();
    }
  }

  int _pageIndex = 0;
  int get pageIndex {
    return _pageIndex;
  }

  void setPageIndex(int index) {
    if (_pageIndex != index) {
      _pageIndex = index;
      notifyListeners();
    }
  }
}
