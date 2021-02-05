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
                Icon(Icons.map),
                Icon(Icons.access_alarm)
              ],
            )),
      ),
    );
  }
}

