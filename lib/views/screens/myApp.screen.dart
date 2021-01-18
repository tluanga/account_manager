import 'package:account_manager/business_logic/view_models/bottomNavigationBarProvider.dart';
import 'package:account_manager/business_logic/view_models/ledgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/settings/books/ledgers/ledger.screen.dart';
import 'package:account_manager/views/screens/settings/books/ledgers/ledgerDashboard.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/ledgerMasterDashboard.screen.dart';
import 'package:account_manager/views/screens/settings/settingsDashboard.screen.dart';
import 'package:account_manager/views/screens/settings/transactionType/ledgerSelect.screen.dart';
import 'package:account_manager/views/screens/settings/transactionType/newTransactionType.screen.dart';
import 'package:account_manager/views/screens/settings/transactionType/transactionTypeDashboard.screen.dart';
import 'package:account_manager/views/screens/transaction/newTransaction.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashBoard.screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LedgerMasterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionTypeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LedgerMasterViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Accounting Manager',

        // ----------------------Route Table------------------------
        routes: {
          rDashBoard: (context) => Dashboard(),
          // ------Settings-------------
          rSettingsDashboard: (context) => SettingsDashboard(),
          rLedgerMasterDashboard: (context) => LedgerMasterDashboard(),
          rNewLedgerMaster: (context) => NewLedgerMaster(),
          rTransactionTypeDashboard: (context) => TransactionTypeDashboard(),
          rNewTransactionType: (context) => NewTransactionType(),
          rLedgerSelect: (context) => LedgerSelect(),
          // ------------Transaction---------------
          rNewTransaction: (context) => NewTransaction(),
          //-------------Book------------------------
          rLedgerDashboard: (context) => LedgerDashboard(),
          rLedger: (context) => Ledger(),
        },
      //  home: Dashboard(),
      home: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: BottomNavigationBarMain(),
        create: (BuildContext context) => BottomNavigationBarProvider(),
      ),
      ),
    );
  }
}





class BottomNavigationBarMain extends StatefulWidget {
  @override
  _BottomNavigationBarMainState createState() =>
      _BottomNavigationBarMainState();
}

class _BottomNavigationBarMainState
    extends State<BottomNavigationBarMain> {
  var currentTab = [
    LedgerMasterDashboard(),
    SettingsDashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}


