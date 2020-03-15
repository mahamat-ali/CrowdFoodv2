import 'package:crowd_food/components/dish_cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DishDetailScreen extends StatefulWidget {
  static final String id = 'DishDetails';
  @override
  _DishDetailScreenState createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff721b65),
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {},
      ),
      backgroundColor: Color(0xffffe2ff),
      appBar: AppBar(
        backgroundColor: Color(0xff721b65),
        title: Text(
          'Dish Details',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
      body: Card(
        color: Colors.grey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(12),
                title: Text(
                  'Noodless',
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
                    'lorem ds sjd sjdncs sdckj cs sdcjjsc sdcnsjcsj scsjcnsjcd scsjcnskj dcsjcns jdcnjsc',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontFamily: 'BellotaText',
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
