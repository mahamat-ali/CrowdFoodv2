import 'package:crowd_food/screens/dish_details.dart';
import 'package:crowd_food/screens/menu.dart';
import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  static final String id = 'Restaurants';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MenuScreen.id);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 300,
            child: Material(
              borderRadius: BorderRadius.circular(6),
              elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(6),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.23),
                      BlendMode.darken,
                    ),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1551530078-379240770349?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1286&q=80',
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Chicken County',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BellotaText',
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
