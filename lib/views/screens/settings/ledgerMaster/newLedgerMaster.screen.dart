import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class NewLedgerMaster extends StatefulWidget {
  final Function updateLedgerMaster;
  final LedgerMaster ledgerm;

  NewLedgerMaster({this.updateLedgerMaster, this.ledgerm});

  @override
  _NewLedgerMasterState createState() => _NewLedgerMasterState();
}

class _NewLedgerMasterState extends State<NewLedgerMaster> {
  final NewLedgerMasterViewModel _model =
      serviceLocator<NewLedgerMasterViewModel>();
  String _name = '';
  String _description = '';

  @override
  void initState() {
    super.initState();

    if (widget.ledgerm != null) {
      _name = widget.ledgerm.name;
      _description = widget.ledgerm.description;
    }
  }

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
