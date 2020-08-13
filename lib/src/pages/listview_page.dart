import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) _fetchData(); 
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page')
      ),
      body: Stack(
        children: <Widget>[
          _createListView(),
          _createLoader()
        ]
      ),
    );
  }

  Widget _createListView(){
    return RefreshIndicator(
      onRefresh: _getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (context, item){
          final imagen = _listNumbers[item];
          return FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://picsum.photos/id/$imagen/200/300'),
            placeholder: AssetImage('assets/gif/jar-loading.gif'), 
          );
        },
      ),
    );
  }

  void _add10(){
    setState(() {
      for (var i = 1; i < 10; i++) _listNumbers.add(_lastNumber++);
    });
  }

  Future<void> _fetchData(){
    _isLoading = true;
    setState(() {});
    new Timer(Duration(seconds: 2), responseHttp);
  }

  Future _getPage1() async{
    return Future.delayed(Duration(seconds: 2));
  }

  void responseHttp(){
    _isLoading = false;
    _add10();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
  }

  Widget _createLoader(){
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.symmetric(vertical: 50.0))
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }
}