import 'package:crowd_food/components/animated_fab.dart';
import 'package:crowd_food/components/dish_cart.dart';
import 'package:crowd_food/components/list_menu.dart';
import 'package:crowd_food/screens/cart.dart';
import 'package:crowd_food/screens/contact_us.dart';
import 'package:crowd_food/screens/order.dart';
import 'package:crowd_food/screens/restaurants.dart';
import 'package:crowd_food/screens/signup_screen.dart';
import 'package:crowd_food/screens/welcome_screen.dart';
import 'package:crowd_food/services/auth_service.dart';
//import 'package:flutter/cupertino.dart';
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
  int selectedItemInDrawer = 0;

  _getBodyWidget(int selectedItemMenu) {
    switch (selectedItemMenu) {
      case 0:
        return DishCard(
          name: 'Noodles',
          photoUrl:
              'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
          description:
              'Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings.',
        );
        break;
      case 1:
        return RestaurantsScreen();
        break;
      case 2:
        return CartScreen();
        break;
      case 3:
        return OrderScreen();
        break;
      case 4:
        return ContactUsScreen();
        break;
      default:
        return Center(
          child: Text('Error!'),
        );
    }
  }

  _getTitles(int selectedItemMenu) {
    switch (selectedItemMenu) {
      case 0:
        return 'Home';
        break;
      case 1:
        return 'Restaurants';
        break;
      case 2:
        return 'Cart';
        break;
      case 3:
        return 'Order Summary';
        break;
      case 4:
        return 'Contact Us';
        break;
      default:
        return 'No Title';
    }
  }

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
    print(selectedItemInDrawer);
    return Scaffold(
      floatingActionButton: selectedItemInDrawer == 0 ? FancyFab() : null,
      drawer: Container(
//        width: 250,
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
                        radius: 40.0,
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
                      Text(
                        'Balance: ₹450',
                        style: TextStyle(
                          fontFamily: 'BellotaText',
                          fontSize: 18,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTileMenuItem(
                  icon: Icon(Icons.home),
                  title: 'Home',
                  callback: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedItemInDrawer = 0;
                    });
                  },
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Restaurants',
                  icon: Icon(Icons.restaurant),
                  callback: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedItemInDrawer = 1;
                    });
                  },
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Cart',
                  icon: Icon(Icons.shopping_cart),
                  callback: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedItemInDrawer = 2;
                    });
                  },
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Order',
                  icon: Icon(Icons.move_to_inbox),
                  callback: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedItemInDrawer = 3;
                    });
                  },
                ),
                Divider(),
                ListTileMenuItem(
                  title: 'Contact us',
                  icon: Icon(Icons.info),
                  callback: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedItemInDrawer = 4;
                      print(selectedItemInDrawer);
                    });
                  },
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
          _getTitles(selectedItemInDrawer),
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
          : _getBodyWidget(selectedItemInDrawer),
    );
  }
}
