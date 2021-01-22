// import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/views/screens/authentication/createLoginPin.screen.dart';
import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/screens/authentication/createLoginPin.screen.dart';
// import 'views/screens/authentication/LoginPin.screen.dart';

void main() {
  runApp(MyApp());
  setUpServiceLocator();
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: CreateLoginPin(),
    );
  }
}
