import 'package:account_manager/business_logic/view_models/settings/changePin/changePin.screen.dart';
import 'package:account_manager/business_logic/view_models/settings/companyProfile/companyProfile.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDetail.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/ui/bottomNavigationBarProvider.dart';
import 'package:account_manager/views/screens/analytics/analyticsDashboard.screen.dart';
import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';

import 'package:account_manager/business_logic/view_models/books/ledger/ledgerDashboard.viewmodel.dart';

// -------SCREENS-------------
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/authentication/LoginPin.screen.dart';
import 'package:account_manager/views/screens/authentication/createLoginPin.screen.dart';
import 'package:account_manager/views/screens/books/booksDashboard.screen.dart';
import 'package:account_manager/views/screens/settings/accountingYear/accountingYear.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/ledgerMasterDashboard.screen.dart';

import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';

import 'package:account_manager/views/screens/settings/settingsDashboard.screen.dart';
import 'package:account_manager/views/screens/settings/transactionType/newTransactionType.screen.dart';
import 'package:account_manager/views/screens/settings/transactionType/transactionTypeDashboard.screen.dart';
import 'package:account_manager/views/screens/transaction/newTransaction.screen.dart';
import 'package:account_manager/views/screens/transaction/transactionTypeSelect.screen.dart';

// ------SCREENS-----BOOKS---------------
import 'package:account_manager/views/screens/books/Journal/JournalDashboard.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'books/ledgers/ledger.screen.dart';
import 'books/ledgers/ledgerDashboard.screen.dart';
import 'dashBoard.screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LedgerMasterDashboardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewLedgerMasterViewModel(),
        ),

        ChangeNotifierProvider(
          create: (context) => EditLedgerMasterViewModel(),
        ),
        //------Transaction Type---------
        ChangeNotifierProvider(
          create: (context) => TransactionTypeDashboardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewTransactionTypeViewModel(),
        ),
        ChangeNotifierProvider(create: (context) => CompanyProfileViewModel()),
        // ---------NEW TRANSACTION----------------
        ChangeNotifierProvider(
          create: (context) => NewTransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionTypeSelectViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionTypeDetailViewModel(),
        ),

        // ChangeNotifierProvider(
        //   create: (context) => TransactionDashboardViewModel(),
        // ),

        // ------------BOOKS-------------
        ChangeNotifierProvider(
          create: (context) => GeneralJournalViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LedgerDashboardViewmodel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        title: 'Accounting Manager',

        // ----------------------Route Table------------------------
        routes: {
          rDashBoard: (context) => DashBoard(),
          //-------------Login Pin----------------
          rCreateLoginPin: (context) => CreateLoginPin(),
          rEnterLoginPin: (context) => LoginPin(),

          // ------Settings-------------
          rAnalyticsDashboard: (context) => AnalyticsDashboard(),
          rBooksDashboard: (context) => BooksDashboard(),
          rSettingsDashboard: (context) => SettingsDashboard(),
          //-------Settings Company ProfilerCompanyProfile
          rCompanyProfile: (context) => BooksDashboard(),


          // -------Settings Accounting Year-----
          rAccountingYear: (context) => AccountingYearDashboard(),

          rLedgerMasterDashboard: (context) => LedgerMasterDashboard(),
          rNewLedgerMaster: (context) => NewLedgerMasterScreen(),

          rTransactionTypeDashboard: (context) => TransactionTypeDashboard(),
          rNewTransactionType: (context) => NewTransactionType(),

          // ------------Transaction---------------
          rNewTransaction: (context) => NewTransaction(),
          rTransactionTypeSelect: (context) => TransactionTypeSelect(),

          //-------------Book------------------------
          rLedgerDashboard: (context) => LedgerDashboard(),
          rLedger: (context) => Ledger(),
          rGeneralJournalDashboard: (context) =>
              GeneralJournalDashboardScreen(),
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

class _BottomNavigationBarMainState extends State<BottomNavigationBarMain> {
  var currentTab = [
    //LedgerMasterDashboard(),
    DashBoard(),
    BooksDashboard(),
    NewTransaction(),
    //  LedgerDashboard(),
    AnalyticsDashboard(),
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
            icon: new Icon(Icons.menu_book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
