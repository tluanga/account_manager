import 'package:account_manager/business_logic/models/count.models.dart';

import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/addLedgerMaster.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/ledgerMasterDashboard.screen.dart';
import 'package:account_manager/views/screens/settings/settingsDashboard.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashBoard.screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Count(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Accounting Manager',

        // ----------------------Route Table------------------------
        routes: {
          rDashBoard: (context) => Dashboard(),
          // ------Settings-------------
          rSettingsDashboard: (context) => SettingsDashboard(),
          rLedgerMasterDashboard: (context) => LedgerMasterDashboard(),
          rAddLedgerMaster: (context) => AddLedgerMaster(),
        },
        home: Dashboard(),
      ),
    );
  }
}
