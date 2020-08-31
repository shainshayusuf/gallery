import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class reelsDetails extends StatefulWidget {
  @override
  _reelsDetailsState createState() => _reelsDetailsState();
}

class _reelsDetailsState extends State<reelsDetails> {
  VideoPlayerController _controller;
  PageController _pagecontroller;


  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/images/videoplayback.mp4');
    _pagecontroller=PageController(
      viewportFraction: 1.0
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.initialize().then((_) => setState(() {}));
    _controller.setLooping(true);
    _controller.setVolume(1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            width: width * 1,
            height: height * 1,
            color: Colors.white,
            child: PageView.builder(
              controller: _pagecontroller,
                itemCount: 4,


                itemBuilder: (context,index){
                 return reelPage(width,height);
            }),
          ),

        ],
      ),
    );
  }
  Widget reelPage(double width,double height){
    return Stack(
      children: [
        Positioned(
          top: 80,
          child: Container(
            height: 275,
            width: width*0.99,
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          right: -70,
          bottom: 0,
          child: Container(
            color: Colors.transparent,
            child: Image.asset('assets/images/Reels.png'),
          ),
        ),
        Positioned(
//            top: 300,
          bottom: 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: width*0.9,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contemporary Art',style: GoogleFonts.montserrat(fontSize: 28,fontWeight: FontWeight.bold,color:  Color(0xff3E5B5C)),),
                  SizedBox(height: 15.0,),
                  Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nulla metus, rhoncus ut mi nec, vulputate gravida ligula. Maecenas sagittis quis quam nec sollicitudt amet, consectetur adipiscing elit. Nam nulla metus, rhoncus ut mi nec, vulputate gravida ligula. Maecenas sagittis quis quam nec sollicituin. Proin a mi ultrices, vulputate augue sit amet, cursus arcu. Mauris bibendum volutpat tincidunt. Quisque in tristique lorem. Donec augue risus, dictum at maximus vel, condimentum eu nunc. Sed commodo convallis felis. Morbi vitae facilisis magna. Vestibulum sit amet sem vulputate, dignissim dui et, blandit est. Quisque nisi ex, mattis molestie eros pretium, efficitur pretium felis. Proin scelerisque enim id mauris pellentesque, vitae ullamcorper nisi ultricies. Quisque odio sem, consequat eu enim eu, tincidunt dignis Read More Mauris luctus augue eu mi pellentesque rhoncus. Phasellu''',style: GoogleFonts.montserrat(fontSize: 12,fontWeight: FontWeight.normal,color:  Color(0xff3E5B5C)),)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left:70,
          child: FadeInDown(
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/reelSlide.png'),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                      child: Image.asset(
                          'assets/images/Icon material-play-circle-filled.png')),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
