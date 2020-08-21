import 'dart:math';

import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  var _quote = "";
  var _count = 0;

  List<String> _quotes = new List<String>();

  int get getCounter => _count;
  String get getQuote => _quote;
  Counter() {
    _quotes.add("Sushant");
    _quotes.add("Sudeep");
    _quotes.add("Amod");
    _quotes.add("Mandar");
    _quotes.add("Ranjit");
    _quotes.add("Sanjay");
  }
  void incrementCounter() {
    // _count += 1;
    Random random = new Random();
    int rnd = random.nextInt(5);
    _quote = _quotes[rnd];
    notifyListeners();
  }
}
