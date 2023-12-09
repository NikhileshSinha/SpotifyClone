import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.deepOrange,
            child: Text(
              "S",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(width: 10,),
          Text(
            'Your library',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'LibreFranklin'
            ),
          ),
          Row(
            children: [
              Icon(Icons.search, color: Colors.white, size: 30,),
              SizedBox(width: 15,),
              Icon(Icons.add, color: Colors.white, size: 30,),
            ],
          ),
        ],
      ),
    );
  }
}
