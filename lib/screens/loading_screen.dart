import 'package:chat_app/screens/logIn_Screen.dart';
import 'package:chat_app/screens/user_screen.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/widget/logo_custom_white.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../services/socket_services.dart';

class LoadingScreen extends StatelessWidget {
  
  Future checkLoginState(BuildContext context)async{
    final authservice = Provider.of<AuthService>(context, listen: false);
    final autenticado = await authservice.isLoggedIn();
    final socketService = Provider.of<SocketService>(context, listen: false);

    if(autenticado){
      socketService.connect();
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent

  ));
    return Scaffold(
      body: FutureBuilder(
      future: checkLoginState(context),
        builder: ( context, snapshot) {
          return Container(
        width: double.infinity, 
        color: Color(0xff9336B4),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  
        children: [
          SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 200,
            child:  Image(image: AssetImage('assets/logo_white.png')),
                
        ),
      
          Text('GHOSTAPP', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),)
        
        ]),
      );
        },
      ),
    );


  }
}