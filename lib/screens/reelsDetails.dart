import 'package:flutter/material.dart';

class reelsDetails extends StatefulWidget {
  @override
  _reelsDetailsState createState() => _reelsDetailsState();
}

class _reelsDetailsState extends State<reelsDetails> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Color(0xff3E5B5C),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            width: width*1,
            height: height*1,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
