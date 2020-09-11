import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  List<MenuData> _menus = List<MenuData>();
  @override
  void initState() {
    MenuData m1 = new MenuData(
        "Egg muffin", "breakfast.png", "Delicious scrambled egg with bacon");
    MenuData m2 = new MenuData("Croissant", "croissant.png",
        "A croissant is a buttery, flaky, viennoiserie pastry of crescent shape.");
    MenuData m3 = new MenuData("Combo", "burger.png",
        "Cheese, Chicken with lettuce and tomato sandwich would compliment french fries perfectly");
    MenuData m4 = new MenuData("Pizza slice", "pizza.png",
        "Pizza is a savory dish of Italian origin topped with tomatoes, cheese, and often various other ingredients.");
    MenuData m5 = new MenuData("Wrap", "kebab.png",
        "A wrap is a food dish made with a soft flatbread rolled around a filling.");
    MenuData m6 = new MenuData("Cheese burger", "food.png",
        "A cheeseburger is a hamburger topped with cheese.");
    MenuData m7 = new MenuData("Large Coffee", "coffee.png",
        "Coffee is a brewed drink prepared from roasted coffee beans.");

    _menus.add(m1);
    _menus.add(m2);
    _menus.add(m3);
    _menus.add(m4);
    _menus.add(m5);
    _menus.add(m6);
    _menus.add(m7);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/paper.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              title: Container(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/tim.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text('test'),
                  ],
                ),
              ),
              backgroundColor: Colors.red[800],
              stretch: true,
              excludeHeaderSemantics: true,
            ),
            // SliverGrid(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.teal[100 * (index % 9)],
            //         child: Text('grid item $index'),
            //       );
            //     },
            //     childCount: _menus.length,
            //   ),
            // )

            //You can use SliverGrid...
            SliverGrid.count(
              crossAxisSpacing: 3,
              crossAxisCount: 2,
              children: _menus
                  .map(
                    (e) => buildCard(context, e),
                  )
                  .toList(growable: false),
            ),

            //..another option is to use SliverList
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) => buildCard(
            //       context,
            //       _menus[index],
            //     ),
            //     childCount: _menus.length,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, MenuData menuData) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  menuData.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/${menuData.iconFile}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    '${menuData.description}',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Stack(
        //   children: [
        //     Text(
        //       menuData.title,
        //       style: Theme.of(context).textTheme.headline5,
        //     ),
        //     Positioned(
        //       top: 40,
        //       left: 40,
        //       child: Container(
        //         height: 64,
        //         width: 64,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage("assets/${menuData.iconFile}"),
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       top: 140,
        //       child: Column(
        //         children: [
        //           Text(
        //             'A blend of tea leaves boiled to perfection mixed with skimmed milk',
        //             softWrap: true,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
    // return Card(
    //   elevation: 3,
    //   shadowColor: Colors.black,
    //   color: Colors.white,
    //   child: Container(
    //     height: 200,
    //     width: 150,
    //     child: InkWell(
    //       focusColor: Colors.blue,
    //       onTap: () => {},
    //       child: ListTile(
    //         title: Text(
    //           'Steeped Tea',
    //           style: Theme.of(context).textTheme.headline5,
    //         ),
    //         subtitle: Text(
    //           'A blend of tea leaves boiled to perfection mixed with skimmed milk',
    //           //style: Theme.of(context).textTheme.headline6,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class MenuData {
  String title;
  String iconFile;
  String description;
  MenuData(this.title, this.iconFile, this.description) {}
}
