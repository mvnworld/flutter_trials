import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trials/counter.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Counter())],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sudeep Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Test Demo Home Page'),
      );
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: buildPageView(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<Counter>().incrementCounter();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: buildBottomAppBar(),
      );

  PageView buildPageView(BuildContext ctx) => PageView(
        controller: _myPage,
        children: [
          Center(
            child: Container(
              child: Text('${ctx.watch<Counter>().getCounter}',
                  style: Theme.of(ctx).textTheme.headline4),
            ),
          ),
          Center(
            child: Container(
              child: Text('AADISH'),
            ),
          ),
        ],
      );

  BottomAppBar buildBottomAppBar() => BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                _myPage.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                _myPage.jumpToPage(1);
              },
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
      );
}
