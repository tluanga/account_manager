import 'package:account_manager/views/widgets/dateSelector.dart';
import 'package:flutter/material.dart';

class BalanceSheetScreen extends StatefulWidget {
  BalanceSheetScreen({Key key}) : super(key: key);

  @override
  _BalanceSheetScreenState createState() => _BalanceSheetScreenState();
}

class _BalanceSheetScreenState extends State<BalanceSheetScreen> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 120,
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  Text('Balance Sheet'),
                  DateSelector()
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.4),
                child: Container(
                  height: 45,
                  color: Colors.cyan[50],
                  child: TabBar(
                    tabs: [
                      Text(
                        'Assets',
                        style: TextStyle(fontSize: 20),
                        
                      ),
                      Text(
                        'Liabilities',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                /// Assets Page
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Current and Fixed Assets',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5,),
                    Expanded(
                      child: Container(
                        color: Colors.deepPurple[100],
                        child: Text('contents'), // put the contents in the expanded widget
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.topCenter,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '200000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
                // Liabilities Page
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Particulars',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5,),
                    Expanded(
                      child: Container(
                        color: Colors.purple[200],
                        child: Text('contents'), // put the contents in the expanded widget
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.topCenter,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '200000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

