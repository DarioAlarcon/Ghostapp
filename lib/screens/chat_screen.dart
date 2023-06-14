import 'package:flutter/material.dart';

import 'package:chat_app/widget/chat_message.dart';

class ChatScreen extends StatefulWidget {
  
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

final _textController = TextEditingController();
final _focusnode = FocusNode();

List<chatMessage> _messages = [
    ];

bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Icon(Icons.arrow_back, color: Colors.black87,),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text('Dario Alarcon', style: TextStyle(color: Colors.black87, fontSize: 17),),
            Text('online', style: TextStyle(color: Colors.black54, fontSize: 13))
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              maxRadius: 18,
              child: Text(
                'DA',
                style: TextStyle(
                  fontSize: 13
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (_,i)=> _messages[i],
                physics: BouncingScrollPhysics(),
                reverse: true,
              )
            ),
            SizedBox(height: 5,),
            Divider(
              height: 1,
            ),

            Container(
              color: Color(0xfff2f2f2),
              child: _inputChat(),
            )
          ],
        ),
      )
    );
  }

Widget _inputChat(){
  return SafeArea(
    child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child:  TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto ) {
                  setState(() {
                    if (texto.trim().length>0) {
                      _estaEscribiendo = true;
                    }else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                focusNode: _focusnode,
                decoration: InputDecoration.collapsed(hintText: 'Mensaje'),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.white
                  ),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    //color: Colors.white,
                    icon: Icon(Icons.send),
                    onPressed: _estaEscribiendo?
                    ()=> _handleSubmit(_textController.text.trim()):
                    null
                    ,
                  ),
                ),
              ),
            )
          ],
        ),
    ),
  );
}

_handleSubmit(String texto){
  if (texto.length==0) return;
  print(texto);
  _textController.clear();
  _focusnode.requestFocus();

  final newMessage = new chatMessage(message: texto, uid: '12d3', animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 300)),);
  _messages.insert(0, newMessage);
  newMessage.animationController.forward();
  setState(() {
    _estaEscribiendo = false;
  });
@override
dispose(){
  for (chatMessage message in _messages){
    message.animationController.dispose();
  }
  super.dispose();
}
}

}