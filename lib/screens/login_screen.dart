import 'package:dreame_project/screens/otp_verification_screen.dart';
import 'package:dreame_project/screens/signup_screen.dart';
import 'package:dreame_project/util/social_login.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) =>OtpScreen()
                        ));
                      },
                      child: Text("SKIP",
                          style: TextStyle(
                            fontFamily: "Maven",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Welcome to",
                      style: TextStyle(
                        fontFamily: "Maven",
                        fontSize: 16,
                        color: Colors.grey,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("DREAM PROJECT",
                      style: TextStyle(
                        fontFamily: "Maven",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("LOGIN TO YOUR ACCOUNT",
                      style: TextStyle(
                        fontFamily: "Maven",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                formFields(),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 20,
                  thickness: 1,
                  endIndent: 20,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                SocialLogin(),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Dont\'t have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Maven",
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                        child: Text("Create One",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Maven",
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formFields() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Enter Email ID",
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.0,
                          color: Color(0xffF16739),
                          style: BorderStyle.solid))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              obscureText: !showPass,
              decoration: InputDecoration(
                  labelText: "Enter Password",
                  suffixIcon: GestureDetector(
                    child: Icon(
                        !showPass ? Icons.visibility : Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.0,
                          color: Color(0xffF16739),
                          style: BorderStyle.solid))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text("Forgot Password?",
                  style: TextStyle(
                    fontFamily: "Maven",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF16739),
                  )),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: InkWell(
                splashColor: Colors.orangeAccent,
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffF16739),
                    ),
                    child: Center(
                        child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Maven",
                      ),
                    )),
                  ),
                )),
          )
        ],
      ),
    );
  }

  
}
