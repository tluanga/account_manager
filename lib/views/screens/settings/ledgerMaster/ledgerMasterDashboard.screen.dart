import 'package:account_manager/business_logic/view_models/ledgerMaster.viewmodel.dart';
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
      body: Consumer<LedgerMasterViewModel>(
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
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue),
          ),
          child: Center(
            child: Text(
              this.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
