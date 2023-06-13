
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/loading_screen.dart';
import 'package:chat_app/screens/logIn_Screen.dart';
import 'package:chat_app/screens/registrer_screen.dart';
import 'package:chat_app/screens/user_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes ={
  'usuario':(_)=> UserScreen(),
  'chat':(_)=> ChatScreen(),
  'cargando':(_)=> LoadingScreen(),
  'log in':(_)=> loginScreen(),
  'registro':(_)=> RegistreScreen()
};