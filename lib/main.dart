import 'package:flutter/material.dart';

import 'package:flutter_components/src/routes/routes.dart';

import 'package:flutter_components/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // This method is called when the path donsen't exists in the routes pre-define in the main.page
      onGenerateRoute: ( RouteSettings routeSettings ) {
        // In this region is possible validate anything
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}
