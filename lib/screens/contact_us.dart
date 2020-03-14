import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  static final String id = 'ContactUs';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl:
                'https://images.unsplash.com/photo-1564911700033-394fddf53154?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '201 Ali Street Building, \nChittode 6318102 Erode, \nTamil Nadu, India',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'BellotaText',
              fontSize: 22,
              color: Colors.grey[600],
            ),
          ),
//          SizedBox(
//            height: 40,
//          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.phoneAlt,
              color: Colors.blueGrey,
              size: 20,
            ),
            trailing: Text(
              '+91 6363 162 807',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BellotaText',
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.fax,
              color: Colors.blueGrey,
              size: 20,
            ),
            trailing: Text(
              '+91 0063 162 803',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BellotaText',
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.envelope,
              color: Colors.blueGrey,
              size: 20,
            ),
            trailing: Text(
              'crowd@food.net',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BellotaText',
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.purple[500],
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.phoneAlt),
                  label: Text('Call'),
                ),
                FlatButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.purple[400],
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.phoneAlt),
                  label: Text('Email'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
