import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class chatMessage extends StatelessWidget {
  
  final String message;
  final String uid;
  final AnimationController animationController;

  const chatMessage({
    super.key, 
    required this.message, 
    required this.uid, 
    required this.animationController
  });

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context,listen: false);

    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        child: Container(
          child: this.uid == authService.usuario.uid?
          _myMessage():
          _contactMessage(),
        ),
      ),
    );
  }
  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 10, bottom: 5, left: 60),
        child: Text(this.message, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 194, 109, 224),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(5), bottomRight: Radius.circular(10))
        ),
      )
    );
  }
  Widget _contactMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 60, bottom: 5, left: 10),
        child: Text(this.message, style: TextStyle(color: Colors.black87),),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
      )
    );
  }
}
