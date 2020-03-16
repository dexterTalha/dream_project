import 'package:dreame_project/walkthrough/walkthrough_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class WelcomeScreen extends StatelessWidget {

  final List<Container> walkthrough = [
    Container(
      child: Walkthrough(
        text: "REACH THE LATEST\nCOLLECTION",
        isLast: false,
        image: "assets/images/walkthrough/walkthrough1.png",
      )
    ),
    Container(
      child: Walkthrough(
        text: "GET SERIVCE FROM\nVERIFIED PROVIDERS",
        isLast: false,
        image: "assets/images/walkthrough/walkthrough2.png",
      )
    ),
    Container(
      child: Walkthrough(
        text: "FIND INSTITUTE AND\nTUTORS ONLINE",
        isLast: false,
        image: "assets/images/walkthrough/walkthrough3.png",
      )
    ),
    Container(
      child: Walkthrough(
        text: "ENTERTAINMENT\nAND MORE",
        isLast: true,
        image: "assets/images/walkthrough/walkthrough4.png",
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LiquidSwipe(
          initialPage: 0,
          enableSlideIcon: true,
          enableLoop: false,
          waveType: WaveType.liquidReveal,
          pages: walkthrough
        ),
      ),
    );
  }
}