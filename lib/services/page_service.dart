import 'package:flutter/material.dart';

class PageService extends ChangeNotifier {
  int activePage = 0;
  String data = '';
  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }

  void setData1(String data1) {
    data = data1;
    notifyListeners();
  }
}
