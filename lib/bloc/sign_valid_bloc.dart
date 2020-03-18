import 'dart:async';
import 'package:dreame_project/bloc/validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/streams.dart' as rx;

class BlocSignUp extends Object with BlocValidator implements BaseBloc {
  final context;
  BlocSignUp(this.context);

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _mobileController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get mobileChanged => _mobileController.sink.add;
  Function(String) get nameChanged => _nameController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<String> get mobile =>
      _mobileController.stream.transform(mobileValidator);
  Stream<String> get name => _nameController.stream.transform(nameValidator);

  Stream<bool> get submit => rx.CombineLatestStream.combine4(
      email, password, mobile, name, (e, p, m, n) => true ?? false);

  login() {
    Fluttertoast.showToast(msg: "Login");
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _mobileController.close();
    _nameController.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
