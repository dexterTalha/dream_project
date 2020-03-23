import 'package:dreame_project/screens/detail_screen.dart';
import 'package:dreame_project/util/categories.dart';
import 'package:dreame_project/util/list_dummy_data.dart';
import 'package:dreame_project/util/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _listViewData = [
    Text("Inducesmile.com"),
    Text("Flutter Dev"),
    Text("Android Dev"),
    Text("iOS Dev!"),
    Text("React Native Dev!"),
    Text("React Dev!"),
    Text("express Dev!"),
    Text("Laravel Dev!"),
    Text("Angular Dev!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      primary: true,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(
                MdiIcons.bellAlert,
                color: Colors.black87,
                size: 25,
              ),
            )
          ],
          leading: InkWell(
            onTap: () => _scaffoldKey.currentState.openDrawer(),
            child: Icon(
              MdiIcons.sortVariant,
              color: Colors.black,
              size: 30,
            ),
          )),
      drawer: ClipPath(
          clipper: DrawerClipper(),
          child: Drawer(
            child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
              SizedBox(height: 100),
              ListTile(
                title: Text("Android"),
                onTap: () {
                  Fluttertoast.showToast(msg: "Hi");
                },
              ),
              ListTile(
                title: Text("iOS"),
                onTap: () {
                  Fluttertoast.showToast(msg: "Hi");
                },
              ),
              ListTile(
                title: Text("Dexter"),
                onTap: () {
                  Fluttertoast.showToast(msg: "Hi");
                },
              ),
              ListTile(
                title: Text("CYL"),
                onTap: () {
                  Fluttertoast.showToast(msg: "Hi");
                },
              ),
            ]),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "What are you \nlooking for?",
                  style: TextStyle(
                    fontFamily: 'Maven',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: 'Maven',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "View All >",
                        style: TextStyle(
                          fontFamily: 'Maven',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF16739),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, position) {
                    Map category = categories[position];
                    return Categories(
                      icon: category["icon"],
                      onPressed: () {
                        Fluttertoast.showToast(msg: category["title"]);
                      },
                      title: category["title"],
                    );
                  }
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Popular Release",
                    style: TextStyle(
                      fontFamily: 'Maven',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "View All >",
                        style: TextStyle(
                          fontFamily: 'Maven',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF16739),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: furnitures.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map furniture = furnitures[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(index.toString(), "low"),
                            ),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 140,
                          child: Hero(
                            tag: "image$index" + "low",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "${furniture["img"]}",
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
