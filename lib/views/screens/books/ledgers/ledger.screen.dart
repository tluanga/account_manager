import 'package:flutter/material.dart';

class Ledger extends StatefulWidget {
  int ledgerId;
  Ledger({Key key}) : super(key: key);

  @override
  _LedgerState createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('Ledger'),
        ),
      ),
    );
  }
}
