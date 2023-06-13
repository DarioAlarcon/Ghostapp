import 'package:flutter/material.dart';

class customLabels extends StatelessWidget {
  final String question;
  final String contenido;
  final String ruta;
  final Color colorPregunta;
  final Color colorContenido;

  const customLabels({super.key, required this.contenido, required this.ruta, required this.question, this.colorPregunta=Colors.black54, this.colorContenido=Colors.white});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.question, 
        style: TextStyle(
          color: this.colorPregunta, 
          fontSize: 15, 
          fontWeight: FontWeight.w400),),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, this.ruta);
          },
          child: Text(
            this.contenido, 
            style: TextStyle(
              color: this.colorContenido, 
              fontSize: 18, 
              fontWeight: FontWeight.bold
            )
          )
        ),
        
      ],
    );;
  }
}