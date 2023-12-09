import 'package:flutter/material.dart';
import 'package:spotify_clone/BottomNavigation.dart';

import 'Widgets/SearchWidget.dart';
import 'Widgets/TopGenre.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(18, 18, 18, 80),
            body: Container(
              child: ListView(
                children: const [
                  SizedBox(height: 10,),
                  Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibreFranklin',
                    ),
                  ),
                  SearchWidget(),
                  TopGenres()
                ],
              ),
            ),
          bottomNavigationBar: BottomBar(1),
        ),
    );
  }
}
