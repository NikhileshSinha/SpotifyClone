import 'package:flutter/material.dart';

import '../../data.dart';

class Cards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double specialWidth = MediaQuery.of(context).size.width / (5.7);
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: specialWidth,),
          ...Data().carousel.map((val){
            return Container(
              child: Row(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(51, 51, 51, 50),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          "FREE",
                          style: TextStyle(
                            color: Color.fromRGBO(194, 194, 194, 50)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            val['free'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(4, 104, 78, 50),
                          Color.fromRGBO(11, 149, 100, 50),
                          Color.fromRGBO(17, 173, 108, 50),
                        ],
                        stops: [
                          0.2,
                          0.5,
                          1,
                        ],
                      ),
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          "PREMIUM",
                          style: TextStyle(
                              color: Color.fromRGBO(194, 194, 194, 50)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            val['premium'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15,),
                ],
              ),
            );
          }),
          SizedBox(width: MediaQuery.of(context).size.width / (8),),
        ],
      ),
    );
  }
}
