import 'package:cached_network_image/cached_network_image.dart';
import 'package:crowd_food/models/dish_model.dart';
import 'package:crowd_food/models/restaurant_model.dart';
import 'package:crowd_food/screens/dish_details.dart';
import 'package:crowd_food/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({this.restoId});
  final String restoId;
  static final String id = 'MenuScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffe2ff),
      appBar: AppBar(
        backgroundColor: Color(0xff721b65),
        title: Text(
          'Menu',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
      body: StreamProvider<List<Dish>>.value(
        value: DatabaseService().dishes,
        child: MenuList(),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dishes = Provider.of<List<Dish>>(context) ?? [];
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DishDetailScreen(dish: dishes[index]);
              }),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 240,
            child: Material(
              borderRadius: BorderRadius.circular(0),
              elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(0),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.15),
                      BlendMode.darken,
                    ),
                    fit: BoxFit.cover,
                    image: NetworkImage(dishes[index].imageUrl),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        dishes[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BellotaText',
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        dishes[index].description,
                        style: TextStyle(
                          fontFamily: 'BellotaText',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: dishes.length,
    );
  }
}
