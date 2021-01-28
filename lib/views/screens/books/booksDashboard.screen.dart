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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            height: 100,
                            width: 100,
                            image: AssetImage('assets/images/aJornal.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(
                            'General Journal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 28),
                          Text('This a a journal\n rating : 5*'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        blurRadius: 5
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 50,
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(
                            'General Ledger',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('This a Ledger\n rating : 5*'),
                        ],
                      )
                    ],
                  ),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}

