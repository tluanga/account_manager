// import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:account_manager/views/screens/authentication/createLoginPin.screen.dart';
import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:flutter/material.dart';

// import 'views/screens/authentication/LoginPin.screen.dart';

void main() {
  runApp(MyApp());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: CreateLoginPin(),
    );
  }
}
