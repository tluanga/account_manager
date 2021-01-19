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
        centerTitle: true,
        title: Text('Ledger Master Dashboard'),
      ),
      body: Consumer<LedgerMasterDashboardViewModel>(
          builder: (context, ledgerMaster, child) {
        ledgerMaster.loadData();
        return ListView.builder(
          itemCount: ledgerMaster.ledgerMasterList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    Text(ledgerMaster.ledgerMasterList[index].name),
                  ],
                ),
              ),
            );
          },
        );
      }),
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
