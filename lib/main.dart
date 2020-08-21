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
       
        body: buildPageView(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<Counter>().incrementCounter();
          },
          tooltip: 'Increment',
          child: Icon(Icons.new_releases),
          backgroundColor: Colors.blueGrey,
        ),
        bottomNavigationBar: buildBottomAppBar(),
      );

  PageView buildPageView(BuildContext ctx) => PageView(
        controller: _myPage,
        children: [
          Center(
            child: Container(
              child: quoteCont(ctx),
            ),
          ),
          Center(
            child: Container(
              child: Text('AADISH'),
            ),
          ),
        ],
      );

  Container quoteCont(BuildContext ctx) => Container(
    height: 200,
    width: 350,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${ctx.watch<Counter>().getQuote}',
                  style: Theme.of(ctx).textTheme.headline2,
                  ),
            ],
          ),
          elevation: 3.0,
        ),
      );

  // Container quoteCont(BuildContext ctx) => Container(
  //     child: Text('${ctx.watch<Counter>().getQuote}',
  //         style: Theme.of(ctx).textTheme.headline1));

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
