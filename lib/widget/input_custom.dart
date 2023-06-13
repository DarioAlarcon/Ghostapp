import 'package:flutter/material.dart';

class customInput extends StatelessWidget {

final IconData icon;
final String placeholder;
final TextEditingController textController;
final TextInputType keyboardType;
final bool isPassword;

  const customInput({ 
    required this.icon, 
    required this.placeholder, 
    required this.textController, 
    this.keyboardType = TextInputType.text, 
    this.isPassword= false
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 5,top: 5,bottom: 5, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 10
                )
              ]
            ),
            child: TextField(
              controller: this.textController,
              autocorrect: false,
              keyboardType: this.keyboardType,
              obscureText: this.isPassword,
              cursorColor: Color(0xffDD58D6),
              decoration: InputDecoration(
                focusColor: Colors.amber,
                prefixIcon: Icon(this.icon),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText:  this.placeholder
              ),
            )
          );
  }
}