import 'package:crowd_food/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'HomeScreen';
  final String userId;
  HomeScreen({this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.withOpacity(0.4),
      body: Center(
        child: RaisedButton(
          child: Text('Logout'),
          onPressed: () {
            AuthService().logout(context);
          },
        ),
      ),
    );
  }
}
