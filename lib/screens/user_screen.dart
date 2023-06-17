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
        toolbarHeight: 70,
        title: Text('Messages', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
        elevation: 0.5,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              splashRadius: 17,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ), 
              onPressed: _configurations,
            )
          )
        ],
      ),
      body: SmartRefresher(
        header: WaterDropHeader(
          
          waterDropColor: Color(0xffFFE79B),
          complete: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle
              ,color: Color.fromARGB(255, 255, 220, 104)
            ),
            child: Icon(Icons.check, color: Colors.white,)),
        ),
        controller: _refreshController,
        child: _listViewUsuarios(),
        enablePullDown: true,
        onRefresh: _cargarUsuario,
      )
    );
  }

_configurations(){
  showDialog(
    context: context, 
    builder: (context){
      return AlertDialog(
        
        actionsPadding: EdgeInsets.all(20),
        actionsAlignment: MainAxisAlignment.start,
        elevation: 0,
        actions: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  margin: EdgeInsets.only(left: 9),
                  child: Icon(Icons.wifi, color: Color.fromARGB(255, 109, 220, 112),
                  /*child: Icon(
                  Icons.wifi_off, color: Colors.red,
                  ),*/
                  ),
                ),
                Text('internet conection')
          
                ],
              ),
              SizedBox(height: 15,),
              Divider(height: 0.5,color: Colors.purpleAccent.withOpacity(0.4),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                IconButton(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashRadius: 20,
                  splashColor: Colors.purpleAccent.withOpacity(0.4),
                  padding: EdgeInsets.only(left: 0),
                  onPressed: (){},
                  icon: Icon(
                    Icons.exit_to_app, color: Color(0xff40128B),
                  ),
                ),
                Text('cerrar sesion')
                ],
              )
            ],
          )
        ],
        title: Center(child: Column(
          children: [
            Text('Configurations'),
            SizedBox(height: 10,),
            Divider(height: 0.5,color: Color(0xffDD58D6))
          ],
        )),
      );
    }
  );
}

  ListView _listViewUsuarios() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_,i)=>_userListTile(usuarios[i]), 
      itemCount: usuarios.length
    );
  }

  ListTile _userListTile(usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Color(0xff9336B4),
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

