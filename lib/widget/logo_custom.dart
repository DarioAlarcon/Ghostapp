import 'package:flutter/material.dart';

class customLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 200,
        child: Column(
          children: [
          Image(image: AssetImage('assets/mNew Canvas.png')),
          SizedBox(height: 15,),
          Text('Message', style: TextStyle(fontSize: 30, color: Color(0xff40128B), fontWeight: FontWeight.bold),)
        ]
        ),
      ),
    );;
  }
}