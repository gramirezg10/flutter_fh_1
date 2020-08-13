import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://www.motociclismo.es/media/cache/big/upload/images/article/5f1967a00de694a57334acc4/5f1969940de694e073349efc-preocupante-nueva-normalidad-valentino-rossi.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('GR'),
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/gif/jar-loading.gif'), 
          image: NetworkImage('https://i.blogs.es/ccff8c/rossi-catar-motogp-2020/1366_2000.jpg'),
          fadeInDuration: Duration(milliseconds: 200), 
        )  
      )
    );
  }
}