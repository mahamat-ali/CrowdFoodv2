import 'package:crowd_food/models/dish_model.dart';
import 'package:crowd_food/models/restaurant_model.dart';
import 'package:crowd_food/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DishCard extends StatelessWidget {
  DishCard({
    this.photoUrl,
    this.name,
    this.description,
    this.restaurantId,
    this.restaurantName,
    this.price,
  });

  final String restaurantId;
  final String restaurantName;
  final double price;
  final String photoUrl;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Dish>>.value(
      value: DatabaseService().dishes,
      child: DishList(),
    );
  }
}

class DishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dishes = Provider.of<List<Dish>>(context) ?? [];

    List<Dish> featuredDishes = dishes.where((dish) {
      return dish.featured;
    }).toList();

    return ListView.builder(
        itemCount: featuredDishes.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 220.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          featuredDishes[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(12),
                    title: Text(
                      featuredDishes[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BellotaText',
                        fontSize: 30,
                        color: Colors.purple,
                      ),
                    ),
                    subtitle: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        featuredDishes[index].description,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontFamily: 'BellotaText',
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        FontAwesomeIcons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
