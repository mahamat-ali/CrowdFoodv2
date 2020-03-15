import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartWidget extends StatelessWidget {
  final String photoUrl;
  final String title;
  final String subTitle;
  final double price;
  final int quantity;
  final Function add;
  final Function remove;
  final Function delete;

  CartWidget({
    this.photoUrl,
    this.title,
    this.subTitle,
    this.price,
    this.quantity,
    this.add,
    this.remove,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.10,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: Image.network(photoUrl),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'BellotaText',
              fontSize: 18,
              color: Colors.purple,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: ₹$price'),
              Text('Quantity: $quantity'),
            ],
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            closeOnTap: false,
            color: Colors.green,
            icon: FontAwesomeIcons.plusCircle,
            onTap: add,
          ),
          Center(
            child: Container(
              child: Text(
                quantity.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          IconSlideAction(
            closeOnTap: false,
            color: Colors.redAccent,
            icon: FontAwesomeIcons.minusCircle,
            onTap: remove,
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            onTap: delete,
          ),
        ],
      ),
    );
    ;
  }
}
