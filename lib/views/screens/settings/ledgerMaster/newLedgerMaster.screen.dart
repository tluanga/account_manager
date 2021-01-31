import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class NewLedgerMasterScreen extends StatefulWidget {
  const NewLedgerMasterScreen({Key key}) : super(key: key);

  @override
  _NewLedgerMasterScreenState createState() => _NewLedgerMasterScreenState();
}

class _NewLedgerMasterScreenState extends State<NewLedgerMasterScreen> {
  String _name;
  String _description;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      if (_name != null && _description != null) {
        NewLedgerMasterViewModel _ledgerMasterViewModel =
            serviceLocator<NewLedgerMasterViewModel>();
        _ledgerMasterViewModel.newLedgerMaster(
          LedgerMaster(
            name: _name,
            description: _description,
          ),
        );
        Navigator.pop(context);
      }
      if (_formKey.currentState.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Processing Data'),
          ),
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('New Ledger Master'),
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
                      labelText: 'Name',
                    ),
                    validator: (input) => input.trim().isEmpty
                        ? 'Please enter Ledger Name'
                        : null,
                    onSaved: (input) => _name = input,
                    initialValue: _name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (input) => input.trim().isEmpty
                        ? 'Please enter description'
                        : null,
                    onSaved: (input) => _name = input,
                    initialValue: _name,
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
