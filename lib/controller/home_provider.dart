import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _visit = 0;

  int get visit => _visit;
   PageController pageController = PageController(initialPage: 0);

  void  setVisit(int newVisit) {
    _visit = newVisit;
    pageController.jumpToPage(newVisit);
    notifyListeners();
  }
}
