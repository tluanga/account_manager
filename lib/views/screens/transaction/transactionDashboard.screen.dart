import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/transaction/debtSettlementDashboard.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'newPurchaseTransaction.screen.dart';

class TransactionDashboardScreen extends StatelessWidget {
  const TransactionDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            child: Text(
              'Transaction Dashboard',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPurchaseTransactionScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  color: cprimaryColor,
                  border: Border.all(
                    color: HexColor(SECONDARYGREYCOLOR),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Buy',
                    style: TextStyle(fontSize: 20, color: HexColor(TEXTCOLOR), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                color: cprimaryColor,
                border: Border.all(
                  color: HexColor(SECONDARYGREYCOLOR),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Sell',
                  style: TextStyle(fontSize: 20, color: HexColor(TEXTCOLOR), fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomerDebtSettlementDashboard()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  color: cprimaryColor,
                  border: Border.all(
                    color: HexColor(SECONDARYGREYCOLOR),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Customer Debt Settlement',
                    style: TextStyle(fontSize: 20, color: HexColor(TEXTCOLOR), fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  color: cprimaryColor,
                  border: Border.all(
                    color: HexColor(SECONDARYGREYCOLOR),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Business Debt Settlement',
                    style: TextStyle(fontSize: 20, color: HexColor(TEXTCOLOR), fontWeight: FontWeight.bold)
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class HexCode {}
