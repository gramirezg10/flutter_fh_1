import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  // const HomeTemp({Key key}) : super(key: key);

  final options = ['option 1', 'option 2', 'option 3', 'option 4', 'option 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
        // children: _createItems(),
      ),
    );
  }

  // List<Widget> _createItems() {
  //   List<Widget> list = new List<Widget> ();
  //   for (String opt in options) {
  //     final tempWidget = ListTile(
  //       leading: Icon(Icons.account_circle),
  //       title: Text(opt),
  //       trailing: Icon(Icons.arrow_forward_ios),
  //     );
  //     list..add(tempWidget)
  //         ..add(Divider());
  //   }
  //   return list;
  // }

  List<Widget> _createItemsShort() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(item + '!'),
            subtitle: Text('other'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider()
        ],
      );
    }).toList();
  }

}