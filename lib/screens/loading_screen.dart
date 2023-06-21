import 'package:chat_app/screens/logIn_Screen.dart';
import 'package:chat_app/screens/user_screen.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  
  Future checkLoginState(BuildContext context)async{
    final authservice = Provider.of<AuthService>(context, listen: false);
    final autenticado = await authservice.isLoggedIn();
    if(autenticado){
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_,__,___)=>UserScreen(),
          transitionDuration: Duration(microseconds: 0)
        )
      );
    }else{
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_,__,___)=>loginScreen(),
          transitionDuration: Duration(microseconds: 0)
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
      future: checkLoginState(context),
        builder: ( context, snapshot) {
          return Center(
            child: Text('Waiting...'),
          );
        },
      ),
    );


  }
}