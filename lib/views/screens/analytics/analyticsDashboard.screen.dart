import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';

class AnalyticsDashboard extends StatelessWidget {
  const AnalyticsDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UICard(
            title: 'Descriptive',
            routeUrl: rGeneralJournalDashboard,
            iconName: Icons.analytics_outlined,
          ),
          UICard(
              title: 'Predictive',
              routeUrl: rLedgerDashboard,
              iconName: Icons.account_balance_wallet_outlined),
          UICard(
            title: 'Prescriptive',
            routeUrl: rLedgerMasterDashboard,
            iconName: Icons.analytics,
          ),
        ],
      ),
    );
  }
}
