import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gallery/includes/gallerySection.dart';
// ignore: must_be_immutable
class GalleryScreen extends StatefulWidget {
  String imgUrl;
  GalleryScreen(this.imgUrl);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  PageController _controller;
  int photoIndex=0;


  @override
  void initState(){
    super.initState();

    _controller=PageController(
        viewportFraction: 0.5,initialPage: photoIndex+1
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool isGallery= widget.imgUrl == 'assets/images/Gallery.png'?true:false;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width*1,
            height: height*1,
          ),

          Positioned(
            right: -70,
            bottom: 0,
            child: Container(
              child: Image.asset(widget.imgUrl),
            ),
          ),
          Positioned(
            top: 80,
            child: Container(
              width: width * 1,
              height: height * 0.85,
              child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final int first = index * 2;
                  final int second = first + 1;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [first, second].map((idx) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                        child: GallerySection(isGallery),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0,0.8),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 5,
              effect: ExpandingDotsEffect(

                  activeDotColor: Color(0xff4F8A8B),
                  dotColor: Colors.grey,
                  expansionFactor: 3,
                  radius: 2.0,
                  dotHeight: 4.0,
                  dotWidth: 7.0),
            ),
          ),
        ],
      ),
    );
  }
}
