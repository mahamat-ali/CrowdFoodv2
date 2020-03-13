import 'package:flutter/material.dart';

class ListTileMenuItem extends StatelessWidget {
  ListTileMenuItem({
    this.title,
    this.icon,
    this.callback,
  });

  final String title;
  final Icon icon;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 15),
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'BellotaText',
          fontSize: 24,
          color: Colors.pink.withOpacity(.7),
        ),
      ),
      onTap: callback,
    );
  }
}
