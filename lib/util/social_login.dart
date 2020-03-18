import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text("CONTINUE WITH SOCIAL ACCOUNT",
              style: TextStyle(
                fontFamily: "Maven",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {},
              child: Card(
                elevation: 6,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff546DEC),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.facebookF, color: Colors.white),
                      Text(
                        "Continue with Facebook",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Maven",
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: InkWell(
              splashColor: Colors.redAccent,
              onTap: () {},
              child: Card(
                elevation: 6,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffDF3535),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.googlePlusG, color: Colors.white),
                      Text(
                        "Continue with Google",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Maven",
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
