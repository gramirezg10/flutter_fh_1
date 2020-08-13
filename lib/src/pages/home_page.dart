import 'package:flutter/material.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:my_app/src/providers/menu_providers.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentPage = 0;
  // final _menu = [
  //   BottomBarItem(iconName: 'home', label: 'Home', content: HomePage()),
  //   BottomBarItem(iconName: 'list', label: 'All items', content: AllItemsPage()),
  //   BottomBarItem(iconName: 'settings', label: 'Settings', content: SettingsPage()),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _list()
    );
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //   BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings'))
      // ]),

      //
      // bottomNavigationBar: BottomBar(
      //   currentPage: _currentPage,
      //   onChanged: (int newCurrentPage) {
      //     setState(() {
      //       _currentPage = newCurrentPage;
      //     });
      //   },
      //   items: _menu,
      // ),
      //

      // body: SafeArea(
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //         child: PageView.builder(
      //           itemBuilder: (context, index){
      //             return _menu[index].content;
      //           },
      //           itemCount: 3,
      //         )
      //       )
      //     ],
      //   )
      //   ),
  }

  Widget _list() {
    return FutureBuilder(
        future: menuProvider.loadData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) =>
            (ListView(children: _createList(snapshot.data, context))));
  }

  List<Widget> _createList(List<dynamic> data, BuildContext context) {
    final List<Widget> list = [];
    data.forEach((item) {
      final widgetTemp = ListTile(
        title: Text(item['texto']),
        leading: Icon(getIconUsingPrefix(name: item['icon']),
            color: Colors.blue[200]),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[200]),
        onTap: () {
          Navigator.pushNamed(context, item['ruta']);
        },
      );
      list..add(widgetTemp)..add(Divider());
    });
    return list;
  }
}
