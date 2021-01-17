import 'package:flutter/material.dart';

class NewLedgerMaster extends StatelessWidget {
  const NewLedgerMaster({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ledger Master'),
      ),
      body: Column(
        children: [
          TextField(),
        ],
      ),
    );
  }
}
