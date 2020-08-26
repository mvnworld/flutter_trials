import 'package:flutter/material.dart';
import 'imgview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageView(),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.new_releases),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  BottomAppBar buildBottomAppBar() => BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                // _myPage.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // _myPage.jumpToPage(1);
              },
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
      );
}
