import 'dart:io';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum serverStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  serverStatus _serverStatus = serverStatus.Connecting;
  late IO.Socket _socket;

  serverStatus get ServerStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  void connect() async {

    final token = await AuthService.getToken();

    this._socket = IO.io(Environment.socketUrl,{
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew':true,
      'extraHeaders':{
        'x-token': token
      }
    });


  this._socket.onConnect((_) {
    this._serverStatus = serverStatus.Online;
    notifyListeners();
  });
  this._socket.on('disconnect',(_) {
    this._serverStatus = serverStatus.Offline;
    notifyListeners();
  });
  
  }

  void disconnect(){
    this._socket.disconnect();
  }

}