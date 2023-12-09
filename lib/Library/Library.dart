import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify_clone/Library/Widgets/Header.dart';
import 'package:spotify_clone/Library/Widgets/Tiles.dart';
import 'package:spotify_clone/Library/Widgets/roundedCards.dart';

import '../BottomNavigation.dart';
import '../data.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          body: ListView(
            children:  [
              SizedBox(height: 10,),
              Header(),
              Row(
                children: [
                  SizedBox(width: 10,),
                  RoundedCards(text: 'Playlist'),
                  SizedBox(width: 10,),
                  RoundedCards(text: 'Artists'),
                ],
              ),
              SizedBox(height: 25,),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.compare_arrows_rounded,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Recently played',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibreFranklin',
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
              ...Data().library.map((val){
                return GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: AssetImage(
                      val['image'].toString()
                    ),
                    radius: 30,
                    shape: val['shape'] as dynamic,
                  ),
                  title: Text(
                    val['name'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  subTitle: Text(
                    val['subtitle'].toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(167, 167, 167, 1),
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
              Tiles(titles: 'Add artists', shape: GFAvatarShape.circle),
              Tiles(titles: 'Add podcasts & shows', shape: GFAvatarShape.square),
            ],
          ),
          bottomNavigationBar: BottomBar(2),
        )
    );
  }
}
