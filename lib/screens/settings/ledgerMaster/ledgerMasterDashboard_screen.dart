import 'package:flutter/material.dart';

class LedgerMasterDashboard extends StatelessWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
      ),
      body: Container(
        child: Text('Ledger Master Dashboard'),
      ),
    );
  }
}
