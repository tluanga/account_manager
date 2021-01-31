import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'newTransaction.screen.dart';

class TransactionDashboardScreen extends StatelessWidget {
  const TransactionDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Transaction Dashboard',
              style: TextStyle(
                fontSize: 15,
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
                MaterialPageRoute(builder: (context) => NewTransactionScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor(SECONDARYGREYCOLOR),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Buy',
                  style: TextStyle(fontSize: 18),
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
                border: Border.all(
                  color: HexColor(SECONDARYGREYCOLOR),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Sell',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor(SECONDARYGREYCOLOR),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Customer Debt Settlement',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor(SECONDARYGREYCOLOR),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Business Debt Settlement',
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}

class HexCode {}
