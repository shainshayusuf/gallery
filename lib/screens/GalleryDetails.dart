import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class galleryDetails extends StatefulWidget {
  final double _expandedBottomSheetBottomPosition = 0;
  final double _collapsedBottomSheetBottomPosition = -330;

  @override
  _galleryDetailsState createState() => _galleryDetailsState();
}

class _galleryDetailsState extends State<galleryDetails>
    with AfterLayoutMixin<galleryDetails> {
  bool isMute = false;
  double _bottomSheetBottomPosition = -400;
  bool isCollapsed = false;
  bool _isDragging = false;
  String imgUrl='assets/images/Line 1.png';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Container(
                child: SizedBox(
                  width: 120,
                  height: 10,
                  child: RaisedButton(
                    color: isMute ? Colors.white : Colors.transparent,
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              isMute ? 'Mute' : 'Sound',
                              style: TextStyle(
                                  color: isMute ? Colors.black : Colors.white),
                            ),
                          ),
                          Icon(
                            isMute ? Icons.volume_off : Icons.volume_up,
                            color: isMute ? Colors.red : Colors.white,
                          )
                        ],
                      ),
                    ),
                    shape: StadiumBorder(side: BorderSide(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        isMute = !isMute;
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: width * 1,
              height: height * 1,
              color: Colors.blueAccent,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              bottom: _bottomSheetBottomPosition,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragUpdate: (detail) {
                  if (detail.delta.distance == 0 || _isDragging) {
                    return;
                  }
                  if (detail.delta.direction < 0) {
                    _onTap();
                  }
                  if (detail.delta.direction > 0) {
                    _onTap();
                  }
                },
//                onVerticalDragDown: (detail) {
//                  _onTap();
//                },
//                onVerticalDragCancel: () {
//                  _isDragging = false;
//                },
//              onVerticalDragStart: (detail){
//                print("Start $detail");
//              },
//                onVerticalDragUpdate: (detail){
//                print("Update ${detail.delta.direction}");
//                },
//                onVerticalDragDown: (detail){
//                print("down $detail");
//                },
                onVerticalDragEnd: (detail){
                _isDragging=false;
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          height: 60,
                          child: Center(
                            child: Image.asset(imgUrl)
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: _clipsWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _clipsWidget() {
    return Container(
        height: 350,
        width: 500,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nulla metus, rhoncus ut mi nec, vulputate gravida ligula. Maecenas sagittis quis quam nec sollicitudin. Proin a mi ultrices, vulputate augue sit amet, cursus arcu. Mauris bibendum volutpat tincidunt. Quisque in tristique lorem. Donec augue risus, dictum at maximus vel, condimentum eu nunc. Sed commodo convallis felis. Morbi vitae facilisis magna. Vestibulum sit amet sem vulputate, dignissim dui et, blandit est. Quisque nisi ex, mattis molestie eros pretium, efficitur pretium felis. Proin scelerisque enim id mauris pellentesque, vitae ullamcorper nisi ultricies. Quisque odio sem, consequat eu enim eu, tincidunt dignis Phasellus elementum luctus pellentesque. Quisque euismod at leo sed dictum. Nulla sit amet eros nec nibh dictum sollicitudin.

Sed ligula dolor, molestie mattis porta nec, auctor a nisi. Aliquam sed massa ut turpis tincidunt lacinia et sed sem. Aliquam ut metus augue. Proin luctus, nibh a rhoncus rutrum, arcu lorem commodo nisi, at luctus odio arcu non felis. Phasellus vel massa dolor. Proin arcu purus, elementum sed faucibus non, volutpat non lectus. In faucibus libero eget lorem sollicitudin egestas. Cras vel mauris a mi malesuada congue id consectetur nibh.''',style: TextStyle(color: Colors.white),));
  }



  _onTap() {
    setState(() {
      _bottomSheetBottomPosition = isCollapsed
          ? widget._expandedBottomSheetBottomPosition
          : widget._collapsedBottomSheetBottomPosition;
      imgUrl=isCollapsed?'assets/images/Path 176.png':'assets/images/Line 1.png';
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        _bottomSheetBottomPosition = widget._collapsedBottomSheetBottomPosition;
      });
    });
  }
}
