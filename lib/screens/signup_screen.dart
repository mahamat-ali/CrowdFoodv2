import 'package:crowd_food/screens/signin_screen.dart';
import 'package:crowd_food/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  final AuthService _authService = AuthService();

  void _onSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _authService.signUpUser(
          context: context,
          name: _name,
          email: _email,
          password: _password,
          imageUrl: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffe2ff),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                          validator: (input) =>
                              input.trim().isEmpty ? 'Must not be empty' : null,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 5,
                                color: Color(0xffe6739f).withAlpha(200),
                              ),
                            ),
                            hintText: 'Name',
                          ),
                          onChanged: (val) {
                            _name = val;
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
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
                                color: Color(0xffe6739f).withAlpha(200),
                              ),
                            ),
                            hintText: 'Email',
                          ),
                          onChanged: (val) {
                            _email = val;
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: TextFormField(
                          validator: (input) =>
                              input.length < 6 ? 'Must be 6+ characters' : null,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 5,
                                color: Color(0xffe6739f).withAlpha(200),
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
                        height: 15,
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Color(0xffe6739f).withAlpha(255),
                                  padding: EdgeInsets.all(10),
                                  onPressed: _onSubmit,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
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
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  color: Colors.black.withOpacity(0.7),
                                  padding: EdgeInsets.all(10),
                                  onPressed: () => Navigator.pushNamed(
                                      context, SignInScreen.id),
                                  child: Text(
                                    'Go to Login',
                                    style: TextStyle(
                                      color: Color(0xffe6739f),
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
