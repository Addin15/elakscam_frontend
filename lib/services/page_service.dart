import 'package:flutter/material.dart';

class PageService extends ChangeNotifier {
  int activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}
