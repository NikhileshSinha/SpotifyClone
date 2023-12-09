import 'package:flutter/material.dart';

import '../../data.dart';
import 'Tiles.dart';

class TopGenres extends StatelessWidget {
  const TopGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Text(
          "Your top genres",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'LibreFranklin',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Tiles(something: Data().genres),
        const SizedBox(height: 10,),
        const Text(
          "Browse all",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'LibreFranklin',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Tiles(something: Data().browseall),
      ],
    );
  }
}
