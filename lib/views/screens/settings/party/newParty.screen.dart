import 'package:account_manager/business_logic/models/party.model.dart';
import 'package:account_manager/business_logic/view_models/settings/party/newParty.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class NewPartyScreen extends StatefulWidget {
  const NewPartyScreen({Key key}) : super(key: key);

  @override
  _NewPartyScreenState createState() => _NewPartyScreenState();
}

class _NewPartyScreenState extends State<NewPartyScreen> {
  String _name;
  String _description;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      if (_name != null && _description != null) {
        NewPartyViewModel _newPartyViewModel =
            serviceLocator<NewPartyViewModel>();
        _newPartyViewModel.newParty(
          Party(
            name: _name,
            description: _description,
          ),
        );
        // Navigator.pop(context);
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
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('New Party'),
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
