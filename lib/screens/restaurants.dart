import 'package:cached_network_image/cached_network_image.dart';
import 'package:crowd_food/models/restaurant_model.dart';
import 'package:crowd_food/screens/menu.dart';
import 'package:crowd_food/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantsScreen extends StatelessWidget {
  static final String id = 'Restaurants';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Restaurant>>.value(
      value: DatabaseService().restaurants,
      child: RestaurantList(),
    );
  }
}

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<List<Restaurant>>(context) ?? [];
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MenuScreen(restoId: restaurant[index].id);
            }));
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
                    image: NetworkImage(restaurant[index].imageUrl),
                  ),
                ),
                child: Center(
                  child: Text(
                    restaurant[index].name,
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
      itemCount: restaurant.length,
    );
  }
}
