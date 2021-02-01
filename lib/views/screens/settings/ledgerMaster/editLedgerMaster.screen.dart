import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditLedgerMasterScreen extends StatefulWidget {
  final LedgerMaster ledgerMaster;
  const EditLedgerMasterScreen({Key key, this.ledgerMaster}) : super(key: key);

  @override
  _EditLedgerMasterScreenState createState() => _EditLedgerMasterScreenState();
}

class _EditLedgerMasterScreenState extends State<EditLedgerMasterScreen> {
  String _name;
  String _description;
  int directOrIndirect;
  int partyOrNotParty;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
    EditLedgerMasterViewModel _ledgerMasterViewModel =
        serviceLocator<EditLedgerMasterViewModel>();
    _ledgerMasterViewModel.updateLedgerMaster(
      LedgerMaster.withId(
        id: widget.ledgerMaster.id,
        name: _name,
        description: _description,
        party: partyOrNotParty,
        directOrIndirect: directOrIndirect,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(PRIMARYCOLOR),
        title: Text('Edit Ledger Master'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: widget.ledgerMaster.name,
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
                      initialValue: widget.ledgerMaster.description,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ToggleSwitch(
                      minWidth: 150.0,
                      minHeight: 40.0,
                      activeBgColor: cprimaryColor,
                      inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                      activeFgColor: HexColor(TEXTCOLOR),
                      initialLabelIndex: 0,
                      labels: ['Direct', 'Indirect'],
                      onToggle: (index) {
                        directOrIndirect = index;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ToggleSwitch(
                      minWidth: 150.0,
                      minHeight: 40.0,
                      activeBgColor: cprimaryColor,
                      inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                      activeFgColor: HexColor(TEXTCOLOR),
                      initialLabelIndex: 1,
                      labels: ['Party Account', 'Not a Party Account'],
                      onToggle: (index) {
                        partyOrNotParty = index;
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
                          color: HexColor(PRIMARYCOLOR),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: HexColor(TEXTCOLOR),
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
      ),
    );
  }
}
