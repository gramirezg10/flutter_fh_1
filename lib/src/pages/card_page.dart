import 'package:flutter/material.dart';
import 'package:my_app/src/util/responsive.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(responsive.hp(1)),
        children: <Widget>[
          _typeCard1(responsive.dp(1.5)),
          SizedBox(
            height: responsive.hp(0.5),
          ),
          _typeCard2()
        ],
      ),
    );
  }

  Widget _typeCard1(double border) {
    return Card(
      elevation: 10.0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo, color: Colors.blue[200]),
            title: Text('First card'),
            subtitle: Text(
                'This is a first card description, im learning about this'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancel'),
                color: Colors.black12,
                onPressed: () => print('tap on cancel button'),
              ),
              FlatButton(
                  child: Text('Ok'),
                  color: Colors.black12,
                  onPressed: () => print('tap on Ok button')),
            ],
          )
        ],
      ),
    );
  }

  Widget _typeCard2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
            placeholder: AssetImage('assets/gif/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 50),
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Any text to image'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.white,
              // blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
