import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/uiCard.widget.dart';
import 'package:flutter/material.dart';

class BooksDashboard extends StatelessWidget {
  const BooksDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UICard(
                title: 'General Journal',
                routeUrl: rGeneralJournalDashboard,
                iconName: Icons.book_outlined,
              ),
              UICard(
                title: 'General Ledger',
                routeUrl: rLedgerDashboard,
                iconName: Icons.account_balance_wallet_outlined,
              ),
              UICard(
                title: 'Cash receipt journal',
                routeUrl: rLedgerMasterDashboard,
                iconName: Icons.article_outlined,
              ),
              UICard(
                title: 'Cash disbursement journal',
                routeUrl: rTransactionTypeDashboard,
                iconName: Icons.assignment_outlined,
              ),
              UICard(
                title: 'Sales journal',
                routeUrl: rLedgerMasterDashboard,
                iconName: Icons.money,
              ),
              UICard(
                title: 'Purchase journal',
                routeUrl: rTransactionTypeDashboard,
                iconName: Icons.assignment_ind_outlined,
              ),
              UICard(
                title: 'Trial Balance',
                routeUrl: rTrialBalance,
                iconName: Icons.library_books,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

