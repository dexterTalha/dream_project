import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    bool isFilled = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
          child: Container(
        height: _height,
        width: _width,
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
              Center(
                child: Text("VERIFY MOBILE NUMBER",
                    style: TextStyle(
                      fontFamily: "Maven",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                    "We have sent you an access code \n via SMS for Mobile number verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Maven",
                      fontSize: 14,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              PinEntryTextField(
                fields: 6,
                onSubmit: (String pin) {
                  if (pin.length == 6) {
                    setState(() {
                      isFilled = true;
                    });
                  }
                  print(isFilled);
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RaisedButton(
                    elevation: 4,
                    onPressed: () {
                      print(isFilled);
                      if (!isFilled) {
                        Fluttertoast.showToast(msg: "Fill otp");
                        return;
                      }
                    },
                    color: Color(0xff60B243),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                          child: Text(
                        "VERIFY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Maven",
                        ),
                      )),
                    )),
              ),
            ]),
      )),
    );
  }
}
