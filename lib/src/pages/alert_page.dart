import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show alert'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _showAlert(context)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context)
        ),
    );
  }
}

void _showAlert(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text('Title'),
        content: Text('content'),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: ()=> Navigator.of(context).pop()
          ),
          FlatButton(
            child: Text('Ok'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: ()=> Navigator.of(context).pop()
          )
        ],
      );
    }
  ); 
}