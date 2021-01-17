import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';

class SettingsDashboard extends StatelessWidget {
  const SettingsDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Dashboard'),
      ),
      body: Column(
        children: [
          UICard(
            title: 'Ledger Master',
            routeUrl: rLedgerMasterDashboard,
          ),
          UICard(
            title: 'Transaction Type',
            routeUrl: rTransactionTypeDashboard,
          ),
        ],
      ),
    );
  }
}
