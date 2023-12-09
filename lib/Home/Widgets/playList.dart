import 'package:flutter/material.dart';

import '../../audio.dart';
import '../../data.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16/5.5,
      ),
      children: Data().playlist.map((val){
        return InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context){
                    return AudioPlayerPro(
                        audioURL: val['audio'].toString(),
                        image: val['image'].toString(),
                        name: val['name'].toString(),
                        favI: 'false',
                      idx: '0',
                    );
                  }
              ),
            );
          },
          child: Card(
            color: const Color.fromRGBO(49, 58, 55, 1),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            val['image'].toString()
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: Text(
                    val['name'].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
    }).toList()
    );
  }
}
