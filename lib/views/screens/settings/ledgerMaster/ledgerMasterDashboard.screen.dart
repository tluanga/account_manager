import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/static/route.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LedgerMasterDashboard extends StatefulWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  _LedgerMasterDashboardState createState() => _LedgerMasterDashboardState();
}

class _LedgerMasterDashboardState extends State<LedgerMasterDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
      ),
      body: Consumer<LedgerMasterDashboardViewModel>(
        builder: (context, ledgerMaster, child) {
          return ListView.builder(
            itemCount: ledgerMaster.ledgerMasterList.length,
            itemBuilder: (BuildContext context, int index) {
              return LedgerMasterListItem(
                name: ledgerMaster.ledgerMasterList[index].name,
              );
            },
          );
        },
      ),
      //  ListView.builder(itemBuilder: (context, index) {
      //   return LedgerMasterTile(name: ledgerMasterList[index].name);
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          rNewLedgerMaster,
        ),
        child: Text(
          '+',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class LedgerMasterListItem extends StatelessWidget {
  final String name;

  LedgerMasterListItem({this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 10,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.teal[100], blurRadius: 1.0)],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                this.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
