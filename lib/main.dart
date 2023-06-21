import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Color(0xff9336B4)
          )
        ),
         
        debugShowCheckedModeBanner: false,
        title: 'Chat app',
        initialRoute: 'cargando',
        routes: appRoutes,
      ),
    );
  }
}
