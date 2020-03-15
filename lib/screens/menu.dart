import 'package:crowd_food/screens/dish_details.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DishDetailScreen.id);
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
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1551530078-379240770349?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1286&q=80',
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Chicken County',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellotaText',
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings.',
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
          itemCount: 3,
        ));
  }
}
