import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';

class SettingsDashboard extends StatelessWidget {
  const SettingsDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            UICard(
              title: 'Company Profile',
              routeUrl: rLedgerMasterDashboard,
              iconName: Icons.work,
            ),
            UICard(
              title: 'Accounting Year',
              routeUrl: rTransactionTypeDashboard,
              iconName: Icons.today,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            UICard(
              title: 'Ledger Master',
              routeUrl: rLedgerMasterDashboard,
              iconName: Icons.library_books,
            ),
            UICard(
              title: 'Transaction Type',
              routeUrl: rTransactionTypeDashboard,
              iconName: Icons.sync_alt,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            UICard(
              title: 'History',
              routeUrl: rLedgerMasterDashboard,
              iconName: Icons.history,
            ),
            UICard(
              title: 'Backup',
              routeUrl: rTransactionTypeDashboard,
              iconName: Icons.backup,
            ),
          ]),
        ],
      ),
    );
  }
}