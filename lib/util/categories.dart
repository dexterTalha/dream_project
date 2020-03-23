import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function onPressed;
  Categories({@required this.icon, this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: onPressed,
            child: Material(
              shape: CircleBorder(),
              elevation: 6,
              child: Container(
                height: 70,
                width: 70,
                child: Center(child: icon)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Flexible(
            child: Container(
              width: 70,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Maven",
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
