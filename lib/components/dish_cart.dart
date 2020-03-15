import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Card(
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
//        height: 394,
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
                    photoUrl,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(12),
              title: Text(
                name,
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
                  description,
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
                  color: Colors.red.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
