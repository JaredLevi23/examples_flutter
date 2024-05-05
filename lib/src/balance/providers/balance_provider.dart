
import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier{

  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  BalanceProvider();

  

}