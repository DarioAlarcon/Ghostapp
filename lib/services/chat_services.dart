import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class chatService with ChangeNotifier{
  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID)async{
    var url  = Uri.parse('${ Environment.apiUrl }/mensajes/$usuarioID');
    final resp = await http.get(url,
      headers: {
        'Content-type': 'application/json',
        'x-token'     : await AuthService.getToken()
      }
    );
    final mensajesResponse = mensajesResponseFromJson(resp.body);
    return mensajesResponse.mensajes;
  }
}