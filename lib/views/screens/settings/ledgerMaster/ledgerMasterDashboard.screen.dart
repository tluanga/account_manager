import 'package:account_manager/business_logic/models/ledgerMaster.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
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
      body: Consumer<LedgerMasterData>(
          builder: (context, ledgerMasterData, child) {
        return Text(
          ledgerMasterData.ledgerMasterList.length.toString(),
        );
      }),
      //  ListView.builder(itemBuilder: (context, index) {
      //   return LedgerMasterTile(name: ledgerMasterList[index].name);
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          rAddLedgerMaster,
        ),
        child: Text('+'),
      ),
    );
  }
}

class LedgerMasterTile extends StatelessWidget {
  final String name;

  LedgerMasterTile({this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(this.name),
    );
  }
}
