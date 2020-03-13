import 'package:crowd_food/components/list_menu.dart';
import 'package:crowd_food/screens/signup_screen.dart';
import 'package:crowd_food/screens/welcome_screen.dart';
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
  bool isLoading = false;

  //List Menus Callbacks
  _logout() async {
    setState(() {
      isLoading = true;
    });
    Navigator.pop(context);
    setState(() {
      isLoading = true;
    });
    await AuthService().logout(context, WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 250,
        child: Drawer(
          child: Scaffold(
            backgroundColor: Color(0xffffe2ff),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xff721b65),
              title: Center(
                child: Text(
                  'Crowd Food',
                  style: TextStyle(
                    fontFamily: 'ViaodaLibre',
                    fontSize: 40.0,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            body: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      Text(
                        'Mahamat Ali',
                        style: TextStyle(
                          fontFamily: 'BellotaText',
                          fontSize: 26,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTileMenuItem(
                  icon: Icon(Icons.home),
                  title: 'Home',
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Restaurants',
                  icon: Icon(Icons.restaurant),
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Cart',
                  icon: Icon(Icons.shopping_cart),
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Order',
                  icon: Icon(Icons.move_to_inbox),
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Contact us',
                  icon: Icon(Icons.info),
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Logout',
                  icon: Icon(Icons.exit_to_app),
                  callback: _logout,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        backgroundColor: Color(0xff721b65),
      ),
      backgroundColor: Color(0xffffe2ff),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text('Home'),
            ),
    );
  }
}
