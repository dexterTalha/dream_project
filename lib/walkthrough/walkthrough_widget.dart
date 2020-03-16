import 'package:dreame_project/helpers/shared_pref.dart';
import 'package:dreame_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  final String text;
  final bool isLast;
  final String image;

  const Walkthrough({Key key, this.text, this.isLast, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: isLast
                  ? Container()
                  : InkWell(
                      onTap: () {
                        SharedPref pref = SharedPref();
                        pref.setOld(true);
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, anim1, anim2) =>
                                    LoginScreen()));
                      },
                      child: Text("SKIP",
                          style: TextStyle(
                            fontFamily: "Maven",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          )),
                    ),
            ),
          ),
          Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Maven",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: isLast ? Colors.black : Colors.white,
                )),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              !isLast
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        splashColor: Colors.greenAccent,
                        onTap: () {
                          SharedPref pref = SharedPref();
                          pref.setOld(true);
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, anim1, anim2) =>
                                      LoginScreen()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff60B243),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Maven",
                                fontSize: 18),
                          )),
                        ),
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
