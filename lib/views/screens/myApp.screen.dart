import 'package:account_manager/business_logic/view_models/books/ledger/ledger.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/books/tradingAccount/tradingAccount.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/books/trialBalance/trialBalance.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/dashboard/dashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/dashboard/ledger_mainDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/party/newParty.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/assetAccount/assetSelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/assetAccount/newAsset.screen.dart';
import 'package:account_manager/business_logic/view_models/settings/companyProfile/companyProfile.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/companyProfile/editCompanyProfile.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';

import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDetail.viewmodel.dart';

import 'package:account_manager/business_logic/view_models/transaction/newOutwardTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newSaleTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/party/partySelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/ui/bottomNavigationBarProvider.dart';
import 'package:account_manager/static/constants.dart';

import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';

import 'package:account_manager/business_logic/view_models/books/ledger/ledgerDashboard.viewmodel.dart';

// -------SCREENS-------------
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/analytics/analyticsDashboard.screen.dart';
import 'package:account_manager/views/screens/authentication/confirm.pin.dart';
import 'package:account_manager/views/screens/books/balanceSheet/balanceSheet.screen.dart';
import 'package:account_manager/views/screens/books/booksDashboard.screen.dart';
import 'package:account_manager/views/screens/books/tradingAccount/tradingAccount.screen.dart';
import 'package:account_manager/views/screens/books/trialBalance/trialBalance.screen.dart';
import 'package:account_manager/views/screens/settings/accountingYear/accountingYear.screen.dart';
import 'package:account_manager/views/screens/settings/companyProfile/companyProfile.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/ledgerMasterDashboard.screen.dart';

import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';

import 'package:account_manager/views/screens/settings/settingsDashboard.screen.dart';

import 'package:account_manager/views/screens/settings/transactionType/newTransactionType.screen.dart';
import 'package:account_manager/views/screens/settings/transactionType/transactionTypeDashboard.screen.dart';
import 'package:account_manager/views/screens/transaction/common/newAssetScreen.dart';
import 'package:account_manager/views/screens/transaction/common/newPartyScreen.dart';
import 'package:account_manager/views/screens/transaction/common/transactionTypeSelect.screen.dart';
import 'package:account_manager/views/screens/transaction/newPurchaseTransaction/newPurchaseTransaction.screen.dart';
import 'package:account_manager/views/screens/transaction/transactionDashboard.screen.dart';

// ------SCREENS-----BOOKS---------------
import 'package:account_manager/views/screens/books/Journal/JournalDashboard.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/createLoginPin.screen.dart';
import 'books/ledgers/ledger.screen.dart';
import 'books/ledgers/ledgerDashboard.screen.dart';
import '../dashboard/dashBoard.screen.dart';
import 'transaction/common/AssetSelection.screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //--------Dashboard
        ChangeNotifierProvider(
          create: (context) => DashboardViewModel(),
        ),

        //----------Settings------------
        ChangeNotifierProvider(
          create: (context) => LedgerMasterDashboardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewLedgerMasterViewModel(),
        ),
        //----Settings--CompanyProfile----------
        ChangeNotifierProvider(
            create: (context) => EditCompanyProfileViewModel()),

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
          create: (context) => NewPurchaseTransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewOutwardTransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionTypeSelectViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionTypeDetailViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewAssetViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewSaleTransactionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LedgerMainDashboardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PartySelectViewModel(),
        ),

        //------------Party---------
        ChangeNotifierProvider(
          create: (context) => NewPartyViewModel(),
        ),

        //------------Asset---------------
        ChangeNotifierProvider(
          create: (context) => AssetSelectViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewAssetViewModel(),
        ),

        // ------------BOOKS-------------
        ChangeNotifierProvider(
          create: (context) => GeneralJournalViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LedgerDashboardViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LedgerViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TrialBalanceViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TradingAccountViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: cprimaryColor,
        ),
        title: 'Accounting Manager',

        // ----------------------Route Table------------------------
        routes: {
          rMyApp: (context) => MyApp(),
          rDashBoard: (context) => DashBoard(),
          //-------------Login Pin----------------
          rCreateLoginPin: (context) => CreateLoginPin(),
          rChangeAuthenticationPin: (context) => ConfirmPIN(),

          // ------Settings-------------
          rAnalyticsDashboard: (context) => SettingsDashboard(),
          rBooksDashboard: (context) => BooksDashboard(),
          rSettingsDashboard: (context) => SettingsDashboard(),
          //-------Settings Company ProfilerCompanyProfile
          rCompanyProfile: (context) => CompanyProfileScreen(),

          // -------Settings Accounting Year-----
          rAccountingYear: (context) => AccountingYearDashboard(),

          rLedgerMasterDashboard: (context) => LedgerMasterDashboard(),
          rNewLedgerMaster: (context) => NewLedgerMasterScreen(),

          rTransactionTypeDashboard: (context) => TransactionTypeDashboard(),
          rNewTransactionType: (context) => NewTransactionType(),

          // -------Settings - People----------
          rNewParty: (context) => NewPartyScreen(),

          //--------Asset---------------
          rAssetSelect: (context) => AssetSelectScreen(),
          rAssetNew: (context) => NewAssetScreen(),

          // ------------Transaction---------------
          rTransactionDashboard: (context) => TransactionDashboardScreen(),
          rNewPurchaseTransaction: (context) => NewPurchaseTransactionScreen(),
          rTransactionTypeSelect: (context) => TransactionTypeSelectScreen(),

          //-------------Book------------------------
          rLedgerDashboard: (context) => LedgerDashboard(),
          rLedger: (context) => LedgerScreen(),
          rGeneralJournalDashboard: (context) =>
              GeneralJournalDashboardScreen(),
          rTrialBalance: (context) => TrialBalanceScreen(),
          rTradingAccount: (context) => TradingAccountScreen(),
          rBalanceSheet: (context) => BalanceSheetScreen(),
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
    TransactionDashboardScreen(),
    AnalyticsDashboardScreen(),
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
