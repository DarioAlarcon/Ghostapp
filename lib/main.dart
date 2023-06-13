import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: Color(0xff9336B4)
        )
      ),
       
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      initialRoute: 'log in',
      routes: appRoutes,
    );
  }
}
