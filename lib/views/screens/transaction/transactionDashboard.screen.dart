import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/transaction/newInwardReturnTransaction.screen.dart';
import 'package:account_manager/views/screens/transaction/newOutwardTransaction.screen.dart';
import 'package:account_manager/views/screens/transaction/newSaleTransaction/newSaleTransaction.screen.dart';

import 'package:account_manager/views/screens/transaction/testTransaction.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'newPurchaseTransaction/newPurchaseTransaction.screen.dart';

class TransactionDashboardScreen extends StatelessWidget {
  final double height = 80;
  final double width = 180;
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
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: cprimaryColor,
            child: Text(
              'Transaction Dashboard',
              style: TextStyle(fontSize: 23, color: HexColor(TEXTCOLOR)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 20,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NewPurchaseTransactionScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          height: height,
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
                              style: TextStyle(
                                  fontSize: 20,
                                  color: HexColor(TEXTCOLOR),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewSaleTransactionScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: cprimaryColor,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Sell',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          color: cprimaryColor,
                          border: Border.all(
                            color: HexColor(SECONDARYGREYCOLOR),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Inward',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: HexColor(TEXTCOLOR),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewInwardReturnTransactionScreen()),
                          );
                        },
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: cprimaryColor,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Inward Return',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewOutwardTransactionScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: cprimaryColor,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Outward',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          color: cprimaryColor,
                          border: Border.all(
                            color: HexColor(SECONDARYGREYCOLOR),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Outward Return',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: HexColor(TEXTCOLOR),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: cprimaryColor,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Customer Debt\nSettlement',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: cprimaryColor,
                            border: Border.all(
                              color: HexColor(SECONDARYGREYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Business Debt\nSettlement',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor(TEXTCOLOR),
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestTransactionScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          color: cprimaryColor,
                          border: Border.all(
                            color: HexColor(SECONDARYGREYCOLOR),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Test Transaction',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: HexColor(TEXTCOLOR),
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
