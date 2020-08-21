import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  var _count = 0;

  int get getCounter => _count;

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}
