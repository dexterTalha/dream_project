import 'package:dreame_project/util/list_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailScreen extends StatefulWidget {
  final index, type;
  DetailScreen(this.index, this.type);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isliked = false;

  Future<bool> isLiked(bool islike) async {
    return !islike;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.bellAlert,
              color: Colors.black87,
              size: 25,
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: "image" + widget.index + widget.type,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "${furnitures[0]["img"]}",
                          height: 240,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -10.0,
                      bottom: 3.0,
                      child: RawMaterialButton(
                        onPressed: () {},
                        fillColor: Colors.white,
                        shape: CircleBorder(),
                        elevation: 4.0,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: LikeButton(
                            isLiked: isliked,
                            padding: EdgeInsets.all(4),
                            circleColor: CircleColor(
                              start: Colors.redAccent,
                              end: Colors.red,
                            ),
                            onTap: (like) {
                              return isLiked(like).then((val) {
                                return isliked = val;
                              });
                            },
                            animationDuration: Duration(milliseconds: 600),
                            likeBuilder: (islike) {
                              return Icon(
                                islike ? Icons.favorite : Icons.favorite_border,
                                color: islike ? Colors.red : Colors.grey,
                                size: 28,
                              );
                            },
                            size: 25,
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.redAccent,
                              dotSecondaryColor: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "${furnitures[0]["name"]}",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "\$550.00",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                "sed magna dictum porta. Praesent sapien massa, "
                "convallis a pellentesque nec, egestas non nisi. "
                "Lorem ipsum dolor sit amet, consectetur adipiscing "
                "elit. Nulla porttitor accumsan tincidunt. "
                "Curabitur arcu erat, accumsan id imperdiet et, "
                "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Photos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: furnitures.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map furniture = furnitures.reversed.toList()[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return DetailScreen(index.toString(), "low");
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Hero(
                            tag: "image$index",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "${furniture["img"]}",
                                height: 100,
                                width: 100,
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
              SizedBox(height: 10),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF16739),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange[200],
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    MdiIcons.plus,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
