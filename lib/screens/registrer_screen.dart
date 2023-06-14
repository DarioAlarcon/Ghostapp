import 'package:chat_app/widget/labels_custom.dart';
import 'package:chat_app/widget/logo_custom_white.dart';
import 'package:chat_app/widget/terminos_custom.dart';
import 'package:chat_app/widget/blue_btn.dart';
import 'package:flutter/material.dart';

import '../widget/input_custom.dart';

class RegistreScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Color(0xff9336B4),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  customLogoWhite(),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    height: 350,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xfff2f2f2)
                    ),
                    child: _form()),
                  customLabels(
                    question: '¿Ya eres miembro?',
                    contenido: 'Ingresa aqui',
                    ruta: 'log in',
                    colorContenido: Color(0xffFFE79B),
                    colorPregunta: Colors.white,
                  ),
                  customTerminos(color: Color(0xfff2f2f2),)
              ],),
          ),
        ),
      )
    );
  }
}




class _form extends StatefulWidget {
  @override
  State<_form> createState() => __formState();
}

class __formState extends State<_form> {

final emailCtrl = TextEditingController();
final passCtrl = TextEditingController();
final namectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
        customInput(
          icon: Icons.person,
          placeholder: 'Name',
          textController: namectrl,
          keyboardType:  TextInputType.text,
         ),
         customInput(
          icon: Icons.mail_outline_outlined,
          placeholder: 'Email',
          textController: emailCtrl,
          keyboardType:  TextInputType.emailAddress,
         ),
        customInput(
          icon: Icons.lock_outline,
          placeholder: 'Password',
          textController: passCtrl,
          keyboardType:  TextInputType.text,
          isPassword: true,
         ),
         SizedBox(
          height: 20,
         ),
        yellowButton(
          titulo: 'Sing up',
          onPressed: (){
            print(namectrl.text);
            print(emailCtrl.text);
            print(passCtrl.text);
          },
        )
        ],
      ),
    );
  }
}

