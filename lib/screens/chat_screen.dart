import 'package:flutter/material.dart';

import 'package:chat_app/widget/chat_message.dart';

class ChatScreen extends StatefulWidget {
  
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

final _textController = TextEditingController();
final _focusnode = FocusNode();

late AnimationController _animationController;
late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end:Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

List<chatMessage> _messages = [
    ];

bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Icon(Icons.arrow_back, color: Color(0xff9336B4),),
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
              backgroundColor: Color(0xff9336B4),
              maxRadius: 18,
              child: Icon(Icons.person, color: Colors.white,)
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
              child:  Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black26)

                ),
                height: 37,
                padding: EdgeInsets.only(left: 8, right: 8),
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Color(0xffDD58D6),
                  controller: _textController,
                  onSubmitted: _handleSubmit,
                  onChanged: (String texto ) {
                    setState(() {
                      if (texto.trim().length>0) {
                        _estaEscribiendo = true;
                        _animationController.forward();
                      }else{
                        _estaEscribiendo = false;
                        _animationController.reverse();
                      }
                      
                    });
                    if(texto.trim().length>0){
                      _animationController.forward();
                    }
                  },
                  focusNode: _focusnode,
                  decoration: InputDecoration.collapsed(hintText: 'Mensaje'),
                ),
              )
            ),
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: _estaEscribiendo?
              SlideTransition(
                position: _slideAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 226, 130),
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
              ):
              Container(),
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

  final newMessage = new chatMessage(message: texto, uid: '123', animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 300)),);
  _messages.insert(0, newMessage);
  newMessage.animationController.forward();
  setState(() {
    _estaEscribiendo = false;
  _animationController.reverse();
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