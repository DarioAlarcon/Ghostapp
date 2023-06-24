import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat_app/global/environment.dart';

import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usuario.dart';

class AuthService with ChangeNotifier{
bool _autenticando = false;
late Usuario usuario;
final _storage = new FlutterSecureStorage();

bool get autenticando => this._autenticando;
set autenticando (bool valor){
  _autenticando=valor;
  notifyListeners();
}
//getters de token
static Future<String> getToken() async{
  final _storage = new FlutterSecureStorage();
  final token = await _storage.read(key: 'token');
  return token!;
}

static Future<void> deleteToken() async{
  final _storage = new FlutterSecureStorage();
  await _storage.delete(key: 'token');
}

Future login (String email, String password)async{
autenticando = true;
    
    final data ={
      'email': email,
      'password': password
    };

    var url  = Uri.parse('${ Environment.apiUrl }/login');
    var resp = await http.post(url,
    body: jsonEncode(data),
    headers:{
        'Content-Type': 'application/json'
    }
    );
    autenticando=false;
    if (resp.statusCode ==200) {
    print(resp.body);
      final LoginResponse = loginResponseFromJson(resp.body);
      this.usuario = LoginResponse.usuario;
      await this._guardarToken(LoginResponse.token);
      return true;
    }else{
      return false;
    }
  }

  Future register (String nombre,String email, String password)async{
  autenticando = true;
    
    final data ={
      'nombre':nombre,
      'email': email,
      'password': password
    };

    var url  = Uri.parse('${ Environment.apiUrl }/login/new');
    var resp = await http.post(url,
    body: jsonEncode(data),
    headers:{
        'Content-Type': 'application/json'
    }
    );
    autenticando=false;
    print(resp.body);

    if (resp.statusCode ==200) {
      final LoginResponse = loginResponseFromJson(resp.body);
      this.usuario = LoginResponse.usuario;
      await this._guardarToken(LoginResponse.token);
      return true;
    }else{
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }

  }

  Future<bool> isLoggedIn()async{
    final token = await this._storage.read(key: 'token')??'';
    var url  = Uri.parse('${ Environment.apiUrl }/login/renew');
    var resp = await http.get(url,
    headers:{
        'Content-Type': 'application/json',
        'x-token': token!
    }
    );
    print(resp.body);

    if (resp.statusCode ==200) {
      final LoginResponse = loginResponseFromJson(resp.body);
      this.usuario = LoginResponse.usuario;
      await this._guardarToken(LoginResponse.token);
      return true;
    }else{
      this.logout();
      return false;
    }
  }

  Future _guardarToken(String token)async{
    return await _storage.write(key: 'token', value: token);
  }

  Future logout()async{
    await _storage.delete(key: 'token');
  }

}