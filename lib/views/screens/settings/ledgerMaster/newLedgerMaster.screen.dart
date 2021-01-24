import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class NewLedgerMaster extends StatelessWidget {
  final NewLedgerMasterViewModel _model =
      serviceLocator<NewLedgerMasterViewModel>();

  void _onSubmit() {
    LedgerMaster _data = LedgerMaster(
      name: 'Cash Account',
      description: 'Cash Account',
    );
    _model.newLedgerMaster(_data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextButton(
          child: Text('submit'),
          onPressed: () {
            _onSubmit();
          },
        ),
      ),
    );
  }
}
