import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'static/constants.dart';
import 'views/screens/authentication/createLoginPin.screen.dart';

void main() {
  runApp(App());
  setUpServiceLocator();
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor(PRIMARYCOLOR),
        primarySwatch: cprimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
