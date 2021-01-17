import 'package:account_manager/business_logic/view_models/ledgerMaster.viewmodel.dart';
import 'package:account_manager/static/route.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LedgerMasterDashboard extends StatefulWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  _LedgerMasterDashboardState createState() => _LedgerMasterDashboardState();
}

class _LedgerMasterDashboardState extends State<LedgerMasterDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
      ),
      body: Consumer<LedgerMasterViewModel>(
          builder: (context, ledgerMaster, child) {
        return Column(
          children: [
            Text('No of Ledger Master'),
            Text(ledgerMaster.ledgerMasterList.length.toString()),
          ],
        );
      }),
      //  ListView.builder(itemBuilder: (context, index) {
      //   return LedgerMasterTile(name: ledgerMasterList[index].name);
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          rNewLedgerMaster,
        ),
        child: Text('+'),
      ),
    );
  }
}
