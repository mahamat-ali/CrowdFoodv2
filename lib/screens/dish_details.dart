import 'package:crowd_food/components/dish_cart.dart';
import 'package:crowd_food/models/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DishDetailScreen extends StatefulWidget {
  DishDetailScreen({this.dish});

  static final String id = 'DishDetails';
  final Dish dish;

  @override
  _DishDetailScreenState createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  Dish dish;

  @override
  void initState() {
    dish = widget.dish;
    super.initState();
  }

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
      body: dish == null
          ? Center(
              child: Center(
                child: Text('Loading..'),
              ),
            )
          : Card(
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
                            dish.imageUrl,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(12),
                      title: Row(
                        children: <Widget>[
                          Text(
                            dish.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellotaText',
                              fontSize: 30,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              '₹${dish.price.round().toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BellotaText',
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          dish.description,
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
