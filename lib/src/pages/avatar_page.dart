import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Scaffold es la barra header, el icono flotante, y el contenido de la pagina
    return Scaffold(
      appBar: AppBar(
         title: Text('Avatar page'),
         actions: <Widget>[
           Container(
            //  margin:  EdgeInsets.all(7.0),
             padding: EdgeInsets.all(5.0),
             child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pinimg.com/originals/e4/3b/0d/e43b0d16c8615c9c4cb357c75e8d9741.png'),
                radius: 30.0,
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 10.0),
             child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white
             ),
           )
         ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://i.pinimg.com/originals/8c/2a/6c/8c2a6c3b28fdfc3ec0cb43ee5673664c.png'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

}