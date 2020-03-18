import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(),
      drawer:
          ClipPath(clipper: DrawerClipper(), child: Drawer(child: Container())),
      body: Scaffold(
        body: Container(),
      ),
    );
  }
}

class DrawerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 2, size.width - 50, size.height);
    path.moveTo(size.width - 50, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
