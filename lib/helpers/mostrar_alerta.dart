import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlaerta(BuildContext context, String titulo, String subtitulo){
  showDialog(
    context: context, 
    builder: (_)=>AlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        MaterialButton(
          child: Text('ok'),
          elevation: 5,
          textColor: Colors.amber,
          onPressed: ()=>Navigator.pop(context)
        )
      ],
    )
  );
}
