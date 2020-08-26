import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  PageController _pageController;
  double pageOffset = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: _pageController,
        children: [
          quoteCard(context, 'assets/3.jpg', pageOffset),
          quoteCard(context, 'assets/4.jpg', pageOffset),
          quoteCard(context, 'assets/5.jpg', pageOffset - 1),
        ],
      ),
    );
  }

  Center quoteCard(BuildContext context, String assetName, double offset) {
    return Center(
      child: Container(
        child: Image.asset(
          assetName,
          fit: BoxFit.none,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment(-offset.abs(), 0),
        ),
        //color: Colors.blue,
      ),
    );
  }
}
