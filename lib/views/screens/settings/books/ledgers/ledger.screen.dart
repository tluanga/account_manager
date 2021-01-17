import 'package:flutter/material.dart';

class Ledger extends StatelessWidget {
  const Ledger({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger'),
      ),
      body: Container(
        child: Text('Ledger'),
      ),
    );
  }
}
