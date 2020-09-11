import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trials/counter.dart';
import 'package:trials/homepage.dart';
import 'package:trials/sliverpage.dart';
import 'package:trials/stackpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sudeep Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SliverPage(), //StackHomePage(), //HomePage(),
      );
}
