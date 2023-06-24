import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/usuario.dart';

import '../global/environment.dart';

class usuarioService{
  Future<List<Usuario>> getUsuarios()async{
    try {
      var url  = Uri.parse('${ Environment.apiUrl }/usuarios');
      final resp = await http.get(url,
      headers: {
        'Content-type': 'application/json',
        'x-token'     : await AuthService.getToken()
      }
      );
      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios;

    } catch (e) {
      return[];
    }
  }
}