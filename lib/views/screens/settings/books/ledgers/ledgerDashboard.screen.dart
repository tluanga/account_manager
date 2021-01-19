import 'package:flutter/material.dart';

class LedgerDashboard extends StatelessWidget {
  const LedgerDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ledger Dashboard'),
      ),
      body: Column(
        children: [Text('List of Ledger')],
      ),
    );
  }
}
