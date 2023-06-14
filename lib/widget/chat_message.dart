import 'package:flutter/material.dart';

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
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        child: Container(
          child: this.uid == '123'?
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
        child: Text(this.message),
        decoration: BoxDecoration(
          color: Colors.red,
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
        child: Text(this.message),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
      )
    );
  }
}
