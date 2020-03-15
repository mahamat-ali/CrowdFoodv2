import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderScreen extends StatelessWidget {
  static final String id = 'Orders';
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.1,
      child: Container(
        height: 420,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://www.fg-a.com/wallpapers/2018-quatrefoil-background-white.jpg',
                ),
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.check,
                    color: Colors.green,
                    size: 50,
                  ),
                  Text(
                    'Thank You',
                    style: TextStyle(
                      fontFamily: 'BellotaText',
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Order Successfully Placed',
                    style: TextStyle(
                      fontFamily: 'BellotaText',
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'TOTAL ITEMS: 1',
                    style: TextStyle(
                      fontFamily: 'BellotaText',
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'TOTAL PRICE: ₹130',
                    style: TextStyle(
                      fontFamily: 'BellotaText',
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    color: Colors.blueGrey.withOpacity(0.7),
                    child: Center(
                      child: Text(
                        'We will keep you posted about the status of the order via notification. We will send you the exact payment amount when your food is ready.',
                        style: TextStyle(
                          fontFamily: 'BellotaText',
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
