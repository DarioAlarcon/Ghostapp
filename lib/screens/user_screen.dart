import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserScreen extends StatefulWidget {
  
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final usuarios = [
      Usuario(online: true, email: 'test1@dmail.com', nombre: 'Jason', uid: '1'),
      Usuario(online: true, email: 'test2@dmail.com', nombre: 'Alexandra', uid: '2'),
      Usuario(online: false, email: 'test3@dmail.com', nombre: 'Ace', uid: '3'),
  ];

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Message', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app, color: Colors.black54,),),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            /*child: Icon(
              Icons.wifi, color: Color.fromARGB(255, 109, 220, 112),
            ),*/
            child: Icon(
              Icons.wifi_off, color: Colors.red,
            ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        child: _listViewUsuarios(),
        enablePullDown: true,
        onRefresh: _cargarUsuario,
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_,i)=>_userListTile(usuarios[i]), 
      separatorBuilder: (_,i)=>Divider(), 
      itemCount: usuarios.length
    );
  }

  ListTile _userListTile(usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurpleAccent,
          child: Text(usuario.nombre.substring(0,2), style: TextStyle(color: Colors.white),),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: usuario.online? Colors.green: Colors.red
          ),
        ),
      );
  }
  _cargarUsuario() async{
      await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}