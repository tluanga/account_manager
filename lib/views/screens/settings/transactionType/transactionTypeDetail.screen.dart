import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDetail.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class TransactionTypeDetailScreen extends StatefulWidget {
  final TransactionType transactionType;
  TransactionTypeDetailScreen({Key key, this.transactionType})
      : super(key: key);

  @override
  _TransactionTypeDetailScreenState createState() =>
      _TransactionTypeDetailScreenState();
}

class _TransactionTypeDetailScreenState
    extends State<TransactionTypeDetailScreen> {
  //---local variable
  String dropdownValue = 'Hralh';
  String _name;
  String _description;
  int _sumChetVelDanType;
  int _selectedDebitSideLedgerId;
  Map<String, String> selectedDebitSideLedger = Map();
  Map<String, String> selectedCreditSideLedger = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<TransactionTypeDetailViewModel>(
          builder: (context, model, child) {
        model.loadData();
        return Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 5,
            bottom: 20,
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Container(
                      child: Center(
                        child: Text(
                          'Edit Transaction Type',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 13,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 16),
                      ),
                      onChanged: (value) {
                        _name = value;
                      },
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
                        onChanged: (value) {
                          setState(() {
                            _description = value;
                          });
                        },
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
                        items: <String>['Lei', 'Hralh', 'Lakluh', 'Pekchhuah']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Sum Chetna',
                          labelStyle: TextStyle(fontSize: 16.0),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10.0),
                          // ),
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
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     border: Border.all(color: Colors.green[300])),
                      child: debitSideLedgerSelect(
                          model.getLedgerMasterListForSearchableDropdown(),
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
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     border: Border.all(color: Colors.green[300])),
                      child: creditSideLedgerSelect(
                          model.getLedgerMasterListForSearchableDropdown(),
                          "local"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(
                        _sumChetVelDanType.toString(),
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
      })),
    );
  }

  Widget debitSideLedgerSelect(List<DropdownMenuItem> listData, mapKey) {
    var length = listData.length.toString();
    print('Length of the data is:$length');
    return new SearchableDropdown(
      isExpanded: true,
      underline: Padding(padding: EdgeInsets.all(5)),
      items: listData,
      value: selectedDebitSideLedger[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text(
        'Select Debit side Ledger',
      ),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          _selectedDebitSideLedgerId = value;
          selectedDebitSideLedger[mapKey] = value;
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
