import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

class Tiles extends StatelessWidget {
  Tiles({super.key, required this.titles, required this.shape});
  String titles;
  GFAvatarShape shape;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      avatar: GFAvatar(
        radius: 30,
        child: Icon(
          Icons.add,
          color: Colors.white54,
          size: 40,
        ),
        backgroundColor: Colors.grey[900],
        shape: shape,
      ),
      title: Text(
        titles,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
      ),
    );
  }
}
