import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/helper/db_helper.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/views/widgets/my_text_box.dart';
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

  final _formKey = GlobalKey<FormState>();
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

  _delete() {
    LedgerMasterDBHelper.instance.deleteLedgerMaster(widget.ledgerm.id);
    widget.updateLedgerMaster();
    Navigator.pop(context);
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // print('$_title, $_date, $_priority');

      LedgerMaster ledgerm = LedgerMaster(
        name: _name,
        description: _description,
      );
      if (widget.ledgerm == null) {
        // Insert the ledgerm to our user's database
        LedgerMasterDBHelper.instance.insertLedgerMaster(ledgerm);
      } else {
        // Update the ledgerm
        ledgerm.id = widget.ledgerm.id;
        LedgerMasterDBHelper.instance.updateLedgerMaster(ledgerm);
      }
      widget.updateLedgerMaster();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Ledger Master'),
            backgroundColor: Colors.grey.shade300,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.shade100,
                            blurRadius: 1.0, // soften the shadow
                            // spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],                // border: Border.all(color: Colors.teal),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:20.0),
                        child: TextFormField(
                          decoration: InputDecoration(                
                          labelText: "Name",
                          border: InputBorder.none
                          ),
                          validator: (input) => input.trim().isEmpty
                          ? 'Please enter Ledger Name'
                          : null,
                            onSaved: (input) => _name = input,
                            initialValue: _name,
                        ),
                      ),
                    ),
                  ),
                ),
                MyTextBox(
                  title: 'Description',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    border: Border.all(
                      color: Colors.green.shade600,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        _submit();
                      },
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
              ],
            ),
          )),
    );
  }
}
