import 'package:flutter/material.dart';
import 'package:spotify_clone/BottomNavigation.dart';
import 'package:spotify_clone/Home/Widgets/headerAction.dart';
import 'package:spotify_clone/Home/Widgets/jumpIn.dart';

import 'Widgets/favourate.dart';
import 'Widgets/playList.dart';
import 'Widgets/recentlyPlayed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(57, 90, 81, 1),
              Color.fromRGBO(46, 71, 65, 1),
              Color.fromRGBO(43, 64, 59, 1),
              Color.fromRGBO(518, 18, 18, 1),
            ], stops: [
              0.01,
              0.03,
              0.06,
              0.2
            ]),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Good Evening",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'LibreFranklin',
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  HeaderAction(),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                height: 210,
                child: const PlayList(),
              ),
              const SizedBox(height: 25,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Recently Played",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'LibreFranklin',
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ],
              ),
              RecentlyPlayed(),
              const SizedBox(height: 2,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Jump back in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'LibreFranklin',
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ],
              ),
              JumpIn(),
              const SizedBox(height: 2,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Favourite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'LibreFranklin',
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ],
              ),
            Builder(builder: (context) {
              if(favList.isNotEmpty) {
                return  Favourate();
              }
              else {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                      'Favourite is empty',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'LibreFranklin',
                        fontWeight: FontWeight.bold,
                      )
                  ),
                );
              }
            }
            ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(0),
      ),
    );
  }
}


