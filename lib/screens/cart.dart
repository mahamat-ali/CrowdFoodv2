import 'package:crowd_food/components/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static final String id = 'Cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return CartWidget(
                  photoUrl:
                      'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                  quantity: 1,
                  price: 290,
                  title: 'Noodless',
                  subTitle: 'loremm sdcn jdncs jsdcsn sdcjsn',
                  add: () {},
                  remove: () {},
                  delete: () {},
                );
              },
            ),
          ),
        ),
        Container(
          height: 70,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {},
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Place Order',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
