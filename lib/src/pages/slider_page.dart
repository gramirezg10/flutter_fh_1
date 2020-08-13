import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  static final pageName = 'slider';

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _iniValue = 450.0;
  bool _lockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        child: Column(
          children: [
            _createSlider(),
            _checkBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider(){
    return Slider(
      min: 300.0,
      max: 800.0,
      value: _iniValue, 
      onChanged: (_lockCheck) ? null : (_value){
        setState(() =>_iniValue=_value);
      }
    );
  }

  Widget _createImage(){
    return Image(
      image: AssetImage('assets/gif/jar-loading.gif'),
      width: _iniValue,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox(){
    return CheckboxListTile(
      title: Text('lock slider'),
      subtitle: Text('option to lock the slider'),
      value: _lockCheck, 
      onChanged: (value){
        setState(() => _lockCheck = value);
      }
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(title: Text('lock slider'),
      subtitle: Text('option to lock the slider'),
      value: _lockCheck, 
      onChanged: (value){
        setState(() => _lockCheck = value);
      }
    );
  }

}