import 'package:flutter/material.dart';

class customLogoWhite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 200,
        child: Column(
          children: [
          Image(image: AssetImage('assets/logo_white.png')),
          SizedBox(height: 15,),
          Text('Register', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),)
        ]
        ),
      ),
    );
  }
}