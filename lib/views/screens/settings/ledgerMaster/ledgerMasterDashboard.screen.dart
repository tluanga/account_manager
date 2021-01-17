import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';

class LedgerMasterDashboard extends StatelessWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
      ),
      body: Column(
        children: [
          Text('ledgerMaster Screen'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          rAddLedgerMaster,
        ),
        child: Text('+'),
      ),
    );
  }
}
