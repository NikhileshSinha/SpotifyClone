import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';

import '../../audio.dart';
import '../../data.dart';

var favList = [
];

class Favourate extends StatelessWidget {
  const Favourate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   child: const Text(
        //     "Recently Played",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 24,
        //       fontFamily: 'LibreFranklin',
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        Container(
            height: 210,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favList.length,
                itemBuilder: (context, index){
                  return Container(
                    width: 150,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      crossAxisAlignment: favList[index]['alignment'] as CrossAxisAlignment,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return AudioPlayerPro(
                                        audioURL: favList[index]['audio'].toString(),
                                        image: favList[index]['image'].toString(),
                                        name: favList[index]['name'].toString(),
                                        favI: favList[index]['fav'],
                                        idx: index.toString(),
                                    );
                                  }
                              ),
                            );
                          },
                          child: Container(
                            child: GFAvatar(
                              shape: favList[index]['shape'] as GFAvatarShape,
                              backgroundImage: AssetImage(
                                favList[index]['image'].toString(),
                              ),
                              radius: 70,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            favList[index]['name'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  );
                })
        ),
      ],
    );
  }
}
