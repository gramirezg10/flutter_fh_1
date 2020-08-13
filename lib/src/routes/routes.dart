import 'package:flutter/material.dart';
import 'package:my_app/src/pages/alert_page.dart';
import 'package:my_app/src/pages/animated_container.dart';
import 'package:my_app/src/pages/avatar_page.dart';
import 'package:my_app/src/pages/card_page.dart';
import 'package:my_app/src/pages/home_page.dart';
import 'package:my_app/src/pages/input_page.dart';
import 'package:my_app/src/pages/listview_page.dart';
import 'package:my_app/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getAppRoute() {
  return <String, WidgetBuilder>{
    'home'              : (BuildContext context) => HomePage(),
    'alert'             : (BuildContext context) => AlertPage(),
    'avatar'            : (BuildContext context) => AvatarPage(),
    'card'              : (BuildContext context) => CardPage(),
    'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
    'input'             : (BuildContext context) => InputPage(),
    SliderPage.pageName : (BuildContext context) => SliderPage(), //another way to routes
    'listview'          : (BuildContext context) => ListViewPage(),
  };
}
