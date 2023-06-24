import 'package:flutter/material.dart';

class customTerminos extends StatelessWidget {
  final  Color color;

  const customTerminos({super.key, required this.color});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          'Términos y condiciones de uso', 
          style: TextStyle(
            color: this.color,
            fontWeight: FontWeight.w300
          )
        )
      ),
    );
  }
}