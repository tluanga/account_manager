import 'package:flutter/material.dart';

import '../static/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: [
        rLedgerMasterDashboard:(context)=>
      ],
      home: Scaffold(appBar: AppBar(title: Text(''),),),
    );
  }
}
