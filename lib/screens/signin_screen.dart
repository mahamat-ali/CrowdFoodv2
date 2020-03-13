import 'package:crowd_food/screens/home_screen.dart';
import 'package:crowd_food/screens/signup_screen.dart';
import 'package:crowd_food/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget {
  static final String id = 'SignInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool isLoading = false;

  final AuthService _authService = AuthService();

  void _onSubmit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      _formKey.currentState.save();
      AuthResult result =
          await _authService.signInUser(email: _email, password: _password);
      if (result == null) {
        setState(() {
          isLoading = false;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffe2ff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                isLoading
                    ? SizedBox(
                        height: 5.0,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.pink[200],
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Text(
                  'Crowd Food',
                  style: TextStyle(
                    fontFamily: 'ViaodaLibre',
                    fontSize: 60.0,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: TextFormField(
                          validator: (input) => !input.contains('@')
                              ? 'Please provide a valid email'
                              : null,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 5,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            hintText: 'Email',
                          ),
                          onChanged: (val) {
                            _email = val;
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          validator: (input) =>
                              input.length < 6 ? 'Must be 6+ characters' : null,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 5,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            hintText: 'Password',
                          ),
                          onChanged: (val) {
                            _password = val;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 60,
                                child: FlatButton(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  color: Colors.black.withOpacity(0.7),
                                  padding: EdgeInsets.all(10),
                                  onPressed: _onSubmit,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color(0xffe6739f).withAlpha(250),
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: 45,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  color: Color(0xffe6739f).withAlpha(200),
                                  padding: EdgeInsets.all(10),
                                  onPressed: () => Navigator.pushNamed(
                                      context, SignUpScreen.id),
                                  child: Text(
                                    'Go to Signup',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
