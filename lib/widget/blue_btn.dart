import 'package:flutter/material.dart';

class yellowButton extends StatelessWidget {

final String titulo;
final Function() onPressed;

  const yellowButton({
    required this.titulo, 
    required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff40128B),
            elevation: 2,
            shadowColor: Colors.black,
            shape: StadiumBorder(),
            ),
            onPressed: this.onPressed, 
            child: Container(
              width: double.infinity,
              height: 40,
              child: Center(
                child: Text(this.titulo, style: TextStyle(fontSize: 19,color: Colors.white, fontWeight: FontWeight.bold,letterSpacing: 1),),
              ),
            ),
            
          );
  }
}