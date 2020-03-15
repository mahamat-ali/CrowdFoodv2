import 'package:crowd_food/components/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  static final String id = 'Cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return CartWidget(
          photoUrl:
              'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
          quantity: 1,
          title: 'Noodless',
          subTitle: 'loremm sdcn jdncs jsdcsn sdcjsn',
          add: () {},
          remove: () {},
          delete: () {},
        );
      },
    );
  }
}
