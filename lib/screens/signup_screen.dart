import 'package:dreame_project/bloc/sign_valid_bloc.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool showPass = false;
  BlocSignUp loginBloc;
  @override
  Widget build(BuildContext context) {

    loginBloc = BlocSignUp(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
 
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("CREATE ACCOUNT",
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
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Already member? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Maven",
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: Text("Login",
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
            child: StreamBuilder<String>(
              stream: loginBloc.mobile,
              builder:(context, snap)=> TextFormField(
                onChanged: loginBloc.mobileChanged,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: snap.error,
                    labelText: "Mobile Number",
                    hintText: "e.g. 9876543210",
                    suffixIcon: Icon(
                      Icons.phone_iphone
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: StreamBuilder<String>(
              stream: loginBloc.name,
              builder: (context, snap) => TextFormField(
                onChanged: loginBloc.nameChanged,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorText: snap.error,
                    hintText: "e.g. John Doe",
                    labelText: "Full Name",
                    suffixIcon: Icon(
                      Icons.person,
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: StreamBuilder<String>(
              stream: loginBloc.email,
              builder: (context, snap) => TextFormField(
                onChanged: loginBloc.emailChanged,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: snap.error,
                    hintText: "e.g.something@example.com",
                    labelText: "Email",
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: StreamBuilder<String>(
              stream: loginBloc.password,
              builder: (context, snap) => TextFormField(
                onChanged: loginBloc.passwordChanged,
                maxLines: 1,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !showPass,
                decoration: InputDecoration(
                  errorText: snap.error,
                    hintText: "Enter Password",
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      child: Icon(
                          !showPass ? Icons.visibility : Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: StreamBuilder<bool>(
              stream: loginBloc.submit,
              builder: (context, snap) => RaisedButton(
                elevation: 6,
                  onPressed: snap.hasData ? () => loginBloc.login() : null,
                  color: Color(0xff60B243),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:15),
                    child: Center(
                        child: Text(
                      "CREATE ACCOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Maven",
                      ),
                    )),
                  )),
            ),
          )
        ],
      ),
    );
  }

  
}
