import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../../../business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';

class NewTransactionType extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

List<String> localData = ['Purchase Account', 'Sales account', 'Machinery'];

class _AppState extends State<NewTransactionType> {
  NewTransactionTypeViewModel _transactionTypeViewModel =
      serviceLocator<NewTransactionTypeViewModel>();
  Map<String, String> selectedDebitSideLedger = Map();
  int _selectedDebitSideLedgerId;
  int _selectedCreditSideLedgerId;
  Map<String, dynamic> selectedCreditSideLedger = Map();
  String _name;
  String _description;
  int _sumChetVelDanType = 1;

  String dropdownValue = 'Hralh';
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _transactionTypeViewModel.loadData();
    super.initState();
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // print('$_name, $_description, $_sumChetVelDanType, $_selectedDebitSideLedgerId');
      _transactionTypeViewModel.newTransactionType(
        TransactionType(
          name: _name,
          description: _description,
          sumChetVelDanType: _sumChetVelDanType,
          debitSideLedger: _selectedDebitSideLedgerId,
          creditSideLedger: _selectedCreditSideLedgerId,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Consumer<NewTransactionTypeViewModel>(
            builder: (context, model, child) {
              print(model.ledgerMasterList.length.toString());
              model.loadData();
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade200),
                          child: Container(
                            child: Center(
                              child: Text(
                                'New Transaction Type',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 13,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(fontSize: 16),
                            ),
                            // onChanged: (value) {
                            //   _name = value;
                            // },
                            validator: (input) => input.trim().isEmpty
                                ? 'Please enter Name'
                                : null,
                            onSaved: (input) => _name = input,
                            initialValue: _name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 13,
                          ),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Description',
                                labelStyle: TextStyle(fontSize: 16),
                              ),
                              // onChanged: (value) {
                              //   setState(() {
                              //     _description = value;
                              //   });
                              // },
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please enter Description'
                                  : null,
                              onSaved: (input) => _description = input,
                              initialValue: _description,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 13,
                          ),
                          child: Container(
                            width: 370,
                            child: DropdownButtonFormField<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.black),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                  _sumChetVelDanType =
                                      model.formatSumChetdanType(newValue);
                                });
                              },
                              items: <String>[
                                'Lei',
                                'Hralh',
                                'Lakluh',
                                'Pekchhuah'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                labelText: 'Sum Chetna',
                                labelStyle: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 35,
                            horizontal: 13,
                          ),
                          child: Container(
                            width: 400,
                            child: debitSideLedgerSelect(
                                model
                                    .getLedgerMasterListForSearchableDropdown(),
                                "local"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 35,
                            horizontal: 13,
                          ),
                          child: Container(
                            width: 400,
                            child: creditSideLedgerSelect(
                                model
                                    .getLedgerMasterListForSearchableDropdown(),
                                "local"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _submit(),
                          child: Container(
                            height: 50,
                            width: 420,
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
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget debitSideLedgerSelect(List<DropdownMenuItem> listData, mapKey) {
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: listData,
      value: selectedDebitSideLedger,
      isCaseSensitiveSearch: false,
      hint: new Text(
        'Select Debit side Ledgersss',
      ),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          _selectedDebitSideLedgerId = value;
        });
      },
    );
  }

  Widget creditSideLedgerSelect(List<DropdownMenuItem> listData, mapKey) {
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: listData,
      value: selectedCreditSideLedger[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text(
        'Select Credit side Ledger',
      ),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          _selectedCreditSideLedgerId = value;
        });
      },
    );
  }
}
