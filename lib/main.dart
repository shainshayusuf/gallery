import 'package:flutter/material.dart';

import 'package:flutter_gallery/tabs/tabScreen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animator/flutter_animator.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();

  var tabStyle = GoogleFonts.montserrat(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);

//    _tabController.addListener(() {
//
//        if(_tabController.previousIndex != _tabController.index) {
//          _key.currentState.forward();
//        }
//
//
//    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    print(_tabController.animation.value);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Container(
        width: width * 1,
        height: height * 1,
        color: Colors.white,
      ),
      FadeIn(
        key: _key,
        child: TabBarView(
          controller: _tabController,
          children: [
            GalleryScreen('assets/images/Gallery.png'),
            GalleryScreen('assets/images/Reels.png'),
          ],
        ),
      ),
//              Positioned(
//                right: -70,
//                bottom: 0,
//                child: Container(
//                  child: Image.asset('assets/images/Gallery.png'),
//                ),
//              ),
//              Positioned(
//                top: 80,
//                child: Container(
//                  width: width * 1,
//                  height: height * 0.85,
//                  child: PageView.builder(
//                    controller: _controller,
//                    scrollDirection: Axis.horizontal,
//                    itemCount: 5,
//                    itemBuilder: (context, index) {
//                      final int first = index * 2;
//                      final int second = first + 1;
//                      return Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [first, second].map((idx) {
//                          return Container(
//                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
//                            child: GallerySection(),
//                          );
//                        }).toList(),
//                      );
//                    },
//                  ),
//                ),
//              ),
//              Align(
//                alignment: Alignment(0.0,0.8),
//                child: SmoothPageIndicator(
//                  controller: _controller,
//                  count: 5,
//                  effect: ExpandingDotsEffect(
//
//                      activeDotColor: Color(0xff4F8A8B),
//                      dotColor: Colors.grey,
//                      expansionFactor: 3,
//                      radius: 2.0,
//                      dotHeight: 4.0,
//                      dotWidth: 7.0),
//                ),
//              ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: TabBar(
              labelStyle: GoogleFonts.montserrat(
                  color: Colors.black38,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: GoogleFonts.montserrat(
                  color: Colors.black38,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.transparent),
                  insets: EdgeInsets.symmetric(horizontal: 10.0)),
              isScrollable: true,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text("Gallery"),
                ),
                Tab(
                  child: Text("Reels"),
                )
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
