import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Text('Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}
