import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLedgerMasterScreen extends StatefulWidget {
  EditLedgerMasterScreen({Key key, int ledgerMasterId}) : super(key: key);

  @override
  _EditLedgerMasterScreenState createState() => _EditLedgerMasterScreenState();
}

class _EditLedgerMasterScreenState extends State<EditLedgerMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ledger Master'),
      ),
      body: Consumer<EditLedgerMasterViewModel>(
        builder: (contex, model, index) {
          return Container(
            child: Text(model.ledgerMasterForUpdate.name),
          );
        },
      ),
    );
  }
}
