import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/ledgerMaster/ledgerMaster_impl.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class NewLedgerMaster extends StatefulWidget {
  final Function updateLedgerMaster;
  final LedgerMaster ledgerMaster;

  NewLedgerMaster({this.updateLedgerMaster, this.ledgerMaster});

  @override
  _NewLedgerMasterState createState() => _NewLedgerMasterState();
}

class _NewLedgerMasterState extends State<NewLedgerMaster> {
  final _formKey = GlobalKey<FormState>();
  final NewLedgerMasterViewModel _model =
      serviceLocator<NewLedgerMasterViewModel>();
  String _name = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    if (widget.ledgerMaster != null) {
      _name = widget.ledgerMaster.name;
      _description = widget.ledgerMaster.description;
    }
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('$_name, $_description');

      LedgerMaster ledgerMaster =
          LedgerMaster(name: _name, description: _description);
      //  print(ledger`)
      if (widget.ledgerMaster == null) {
        _model.newLedgerMaster(ledgerMaster);
      } else {
        ledgerMaster.id = widget.ledgerMaster.id;
        _model.updateLedgerMaster(ledgerMaster);
      }
      widget.updateLedgerMaster();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Ledger Name',
                  ),
                  autofocus: false,
                  onSaved: (input) => _name = input,
                  initialValue: _name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'description',
                    hintMaxLines: 50,
                  ),
                  onSaved: (input) => _description = input,
                  initialValue: _description,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  onPressed: _submit,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
