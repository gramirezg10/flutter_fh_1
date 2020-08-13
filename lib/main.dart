import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:my_app/src/pages/home_page.dart';
import 'package:my_app/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [
        const Locale('en'),
        const Locale('es')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomePage()
      initialRoute: 'home',
      routes: getAppRoute(),
      onGenerateRoute: (settings){
        print('route indicated --${settings.name}-- and not exists');
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }
}