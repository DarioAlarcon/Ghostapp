import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/socket_services.dart';
import 'package:chat_app/widget/labels_custom.dart';
import 'package:chat_app/widget/logo_custom.dart';
import 'package:chat_app/widget/terminos_custom.dart';
import 'package:chat_app/widget/yellow_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widget/input_custom.dart';

class loginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark

  ));
    return Scaffold(
    
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  customLogo(),
                  _form(),
                  customLabels(
                    question: '¿no tienes cuenta?',
                    contenido: 'Unete ahora',
                    ruta: 'registro',
                    colorContenido: Color(0xff9336B4),
                  ),
                  customTerminos(color: Colors.black,)
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

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    final authService = Provider.of<AuthService>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
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
        yellowButton(
          titulo: 'Log in',
          onPressed: authService.autenticando? ()=>null : ()async{
            FocusScope.of(context).unfocus();
            
            final loginOK = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
            if(loginOK){
              socketService.connect();
              Navigator.pushReplacementNamed(context, 'usuario');
            }else{
              mostrarAlaerta(context, 'Login Incorrecto', 'revise sus credenciales nuevamente');
            }

          },
        )
        ],
      ),
    );
  }
}

