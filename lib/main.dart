import 'package:crowd_food/screens/cart.dart';
import 'package:crowd_food/screens/contact_us.dart';
import 'package:crowd_food/screens/home_screen.dart';
import 'package:crowd_food/screens/orders.dart';
import 'package:crowd_food/screens/restaurants.dart';
import 'package:crowd_food/screens/welcome_screen.dart';
import 'package:crowd_food/screens/signin_screen.dart';
import 'package:crowd_food/screens/signup_screen.dart';
import 'package:crowd_food/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreen() {
    return StreamBuilder<FirebaseUser>(
      stream: AuthService().user,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen(userId: snapshot.data.uid);
        } else {
          return WelcomeScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crowd Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getScreen(),
      routes: {
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        RestaurantsScreen.id: (context) => RestaurantsScreen(),
        CartScreen.id: (context) => CartScreen(),
        OrdersScreen.id: (context) => OrdersScreen(),
        ContactUsScreen.id: (context) => ContactUsScreen()
      },
    );
  }
}
