import 'package:flutter/material.dart';

class TransactionTypeSelect extends StatelessWidget {
  const TransactionTypeSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Transaction Type Select'),
        ),
        body: Container(
          child: Text('test'),
        ));
  }
}
