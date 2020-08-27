import 'package:flutter/material.dart';
import 'package:flutter_gallery/screens/GalleryDetails.dart';
import 'package:flutter_gallery/screens/reelsDetails.dart';
import 'package:google_fonts/google_fonts.dart';

class GallerySection extends StatelessWidget {
  bool isGallery;
  GallerySection(this.isGallery);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 280,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 160,
            height: 195,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF428182), const Color(0xFF2F3133)],
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100),blurRadius: 10.0)
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 85),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 100,
                      child: Text(
                        '''South Indian Sculptures''',
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 120,
                    child: Text(
                      '''Lorem ipsum dolor sit amet, coulla maximus lectus vitae sem aliquet, in cursus libero Read More''',
                      style: GoogleFonts.montserrat(
                          fontSize: 8, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: SizedBox(
                      width: 80,
                      height: 23,
                      child: OutlineButton(
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Expanded(
                              child: Text("Know more",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 6,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 6,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        borderSide: BorderSide(color: Colors.white54),
                        shape: StadiumBorder(),
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (context, animation, anotherAnimation) {
                                return isGallery?galleryDetails():reelsDetails();
                              },
                              transitionDuration: Duration(milliseconds: 1000),
                              transitionsBuilder:
                                  (context, animation, anotherAnimation, child) {
                                animation = CurvedAnimation(
                                    curve: Curves.fastOutSlowIn, parent: animation);
                                return Align(
                                  child: SizeTransition(
                                    sizeFactor: animation,
                                    child: child,
                                    axisAlignment: 0.0,
                                  ),
                                );
                              }));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          child: Image(
            image: AssetImage('assets/images/Repeat Grid 1.png'),
            width: 150,
            height: 150,
          ),
        )
      ],
    );
  }
}
