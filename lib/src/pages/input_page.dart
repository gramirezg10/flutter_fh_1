import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _date = '';
  TextEditingController _inputDate = new TextEditingController();
  List<String> _bikes = ['vstrom', 'klr', '790 ADV R'];
  String _selectedItem = 'vstrom';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown(),
          Divider(),
          _createPerson()
        ],
      )
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: false,
      // textCapitalization: TextCapitalization.sentences, // doesnt work
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 5.0
        ),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Person name',
        helperText: 'Only type the name',
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (text) {
        setState(() {
          _name = text;
        });
      },
    );
  }

  Widget _createEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'email@domain.com',
        labelText: 'E-mail',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (text) => setState(() {
          _email = text;
        })
    );
  }

  Widget _createPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Password',
        icon: Icon(Icons.lock_outline),
        suffixIcon: Icon(Icons.lock_open),
      ),
    );
  }

  Widget _createDate(BuildContext context){
    return TextField(
      controller: _inputDate,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Date',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.date_range),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picked =  await showDatePicker(
      context: context, 
      locale: Locale('es','ES'),
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2025)
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputDate.text = _date.toString();
      });
    }
  }

  List<DropdownMenuItem<String>> _getDMI(){
    List<DropdownMenuItem<String>> list = new List();
    _bikes.forEach((item) {
      list.add(DropdownMenuItem(
        child: Text(item, textAlign: TextAlign.center),
        value: item,
      ));
    });
    return list;
  }

  Widget _createDropDown(){
    return Row(
      children: [
        Icon(Icons.filter_list),
        SizedBox(width: 20),
        DropdownButton(
          value: _selectedItem ,
          items: _getDMI(),
          onChanged: (opt){
            setState(() {
              _selectedItem = opt; 
              print(opt);
            });
          }
        ),
      ],
    );
  }

  Widget _createPerson(){
      return ListTile(
      title: Text('The person name is "$_name"'),
      subtitle: Text('The email is "$_email"'),
      );
    
  }
}