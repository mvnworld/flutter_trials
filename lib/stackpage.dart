import 'package:flutter/material.dart';

class StackHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 10,
        title: Container(
          //color: Colors.black,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tim.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.red[800],
      ),
      body: Stack(
        children: [
          Container(
            //height: size.height * .45,
            decoration: BoxDecoration(
              //color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("assets/paper.jpg"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                10,
                (index) => buildCard(context),
              ),
            ),
          )
          // GridView.count(
          //   crossAxisCount: 2,
          //   crossAxisSpacing: 5,
          //   children: [
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //     buildCard(context),
          //   ],
          // ),
        ],
      ),
    );
  }

  Card buildCard(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        height: 200,
        width: 150,
        child: InkWell(
          focusColor: Colors.blue,
          onTap: () => {},
          child: ListTile(
            title: Text(
              'Steeped Tea',
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              'A blend of tea leaves boiled to perfection mixed with skimmed milk',
              //style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
