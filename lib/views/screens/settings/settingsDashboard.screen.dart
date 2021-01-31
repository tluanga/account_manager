import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';

class SettingsDashboard extends StatelessWidget {
  const SettingsDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UICard(
              title: 'Company Profile',
              routeUrl: rCompanyProfile,
              iconName: Icons.work,
            ),
            UICard(
              title: 'Accounting Year',
              routeUrl: rAccountingYear,
              iconName: Icons.today,
            ),
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
            UICard(
              title: 'Party',
              routeUrl: rParty,
              iconName: Icons.sync_alt,
            ),
            UICard(
              title: 'Change Authentication \n Pin',
              routeUrl: rChangeAuthenticationPin,
              iconName: Icons.history,
            ),
            UICard(
              title: 'Backup',
              routeUrl: rTransactionTypeDashboard,
              iconName: Icons.backup,
            ),
          ],
        ),
      ),
    );
  }
}
