import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NewLedgerMasterScreen extends StatefulWidget {
  @override
  _NewLedgerMasterScreenState createState() => _NewLedgerMasterScreenState();
}

class _NewLedgerMasterScreenState extends State<NewLedgerMasterScreen> {
  String _name;
  String _description;
  int directOrIndirect = 0;
  int partyOrNotParty = 1;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    NewLedgerMasterViewModel _ledgerMasterViewModel =
        serviceLocator<NewLedgerMasterViewModel>();
    _ledgerMasterViewModel.newLedgerMaster(
      LedgerMaster(
          name: _name,
          description: _description,
          party: partyOrNotParty,
          directOrIndirect: directOrIndirect),
    );
    print(_name);
    print(_description);
    print(directOrIndirect.toString());
    String party = directOrIndirect.toString();
    print('Direct or Indirect $party');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(PRIMARYCOLOR),
        title: Text('NewLedger Master'),
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
                      initialValue: '',
                      decoration:
                          InputDecoration(labelText: 'Please Enter  Name'),
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
                          labelText: 'Please enter description'),
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
