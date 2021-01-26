import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class EditLedgerMasterScreen extends StatefulWidget {
  final LedgerMaster ledgerMaster;
  const EditLedgerMasterScreen({Key key, this.ledgerMaster}) : super(key: key);

  @override
  _EditLedgerMasterScreenState createState() => _EditLedgerMasterScreenState();
}

class _EditLedgerMasterScreenState extends State<EditLedgerMasterScreen> {
  String _name;
  String _description;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    EditLedgerMasterViewModel _ledgerMasterViewModel =
        serviceLocator<EditLedgerMasterViewModel>();
    _ledgerMasterViewModel.updateLedgerMaster(
      LedgerMaster.withId(
          id: widget.ledgerMaster.id, name: _name, description: _description),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Edit Ledger Master'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: widget.ledgerMaster.name ?? ''),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: widget.ledgerMaster.description ?? ''),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _description = value;
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onSubmit();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
