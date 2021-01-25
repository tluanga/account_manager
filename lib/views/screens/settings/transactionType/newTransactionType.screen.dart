import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';

import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class NewTransactionType extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

List<String> localData = ['Purchase Account', 'Sales account', 'Machinery'];

class _AppState extends State<NewTransactionType> {
  Map<String, String> selectedDebitSideLedger = Map();
  Map<String, String> selectedCreditSideLedger = Map();
  String dropdownValue = 'Hralh';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewTransactionTypeViewModel>(
        builder: (context, model, child) {
          return SafeArea(
            child: GestureDetector(
              onTap:() => FocusScope.of(context).unfocus(),
                          child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 52,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        child: TextField(
                          maxLength: 50,
                            decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Lei', 'Hralh', 'Lakluh', 'Pekchhuah']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.green[300]),
                        ),
                        child: debitSideLedgerSelect(localData, 'local')
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.green[300])),
                        child: creditSideLedgerSelect(localData, 'local')
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          rTransactionTypeDashboard,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 420,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            border: Border.all(
                              color: Colors.green,
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
          );
        },
      ),
    );
  }

  Widget debitSideLedgerSelect(List<String> listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < listData.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: items,
      value: selectedDebitSideLedger[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text('Select Debit side Ledger',),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedDebitSideLedger[mapKey] = value;
        });
      },
    );
  }

  Widget creditSideLedgerSelect(List<String> listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < listData.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: items,
      value: selectedCreditSideLedger[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text('Select Credit side Ledger'),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedCreditSideLedger[mapKey] = value;
        });
      },
    );
  }
}
