import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:account_manager/views/screens/transaction/transactionTypeSelect.screen.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NewPurchaseTransactionScreen extends StatefulWidget {
  const NewPurchaseTransactionScreen({Key key}) : super(key: key);

  @override
  _NewPurchaseTransactionScreenState createState() =>
      _NewPurchaseTransactionScreenState();
}

class _NewPurchaseTransactionScreenState
    extends State<NewPurchaseTransactionScreen> {
  DateTime _dateTime = DateTime.now();
  NewPurchaseTransactionViewModel _newPurchaseTransactionViewModel =
      serviceLocator<NewPurchaseTransactionViewModel>();

  final _formKey = GlobalKey<FormState>();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _journalConfirmBottomSheet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<NewPurchaseTransactionViewModel,
          TransactionTypeSelectViewModel>(
        builder: (context, newTransaction, transactionTypeSelect, child) {
          String labelText = 'Please Select Transaction Type';
          if (transactionTypeSelect.selectedTransactionType != null) {
            labelText = transactionTypeSelect.selectedTransactionType.name;
          }
          newTransaction.loadParty();
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Purchase',
                        style: TextStyle(
                            fontSize: 20,
                            color: HexColor(
                              TEXTCOLOR,
                            )),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          focusColor: HexColor(TEXTCOLOR),
                          hoverColor: HexColor(TEXTCOLOR),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Amount';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            newTransaction.setAmount(int.parse(value));
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Particulars'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Particular';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          newTransaction.setParticular(value);
                        },
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToggleSwitch(
                          minWidth: 120.0,
                          minHeight: 40.0,
                          fontSize: 16.0,
                          activeBgColor: HexColor(PRIMARYCOLOR),
                          inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                          activeFgColor: HexColor(TEXTCOLOR),
                          initialLabelIndex: 1,
                          labels: ['Ba', 'Balo'],
                          onToggle: (index) {
                            newTransaction.setBaOrBalo(index);
                            if (index == cBA) {
                              _modalBottomSheet(context);
                            }
                          },
                        ),
                      ),
                      ToggleSwitch(
                        minWidth: 120.0,
                        minHeight: 40.0,
                        activeBgColor: cprimaryColor,
                        inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                        activeFgColor: HexColor(TEXTCOLOR),
                        initialLabelIndex: 0,
                        labels: ['Cash', 'Bank'],
                        onToggle: (index) {
                          newTransaction.setCashOrBank(index);
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: cprimaryColor)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Date :'),
                              RaisedButton(
                                elevation: 0,
                                color: Colors.transparent,
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2030),
                                  ).then((date) {
                                    newTransaction.setDate(date);
                                  });
                                },
                                child: Text(
                                  DateFormat('dd/MM/yyyy').format(_dateTime),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TransactionTypeSelectScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: HexColor(PRIMARYCOLOR),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              labelText,
                              style: TextStyle(
                                color: HexColor(TEXTCOLOR),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          //------Reset Part
                          transactionTypeSelect.deSelectTransactionType(
                              transactionTypeSelect.selectedTransactionType.id);
                          Navigator.pushNamed(context, rMyApp);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: HexColor(PRIMARYCOLOR),
                          ),
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                newTransaction.setData();
                                _submit();
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: HexColor(TEXTCOLOR),
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: HexColor(PRIMARYCOLOR),
                          ),
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  color: HexColor(TEXTCOLOR),
                                  fontSize: 19,
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
        },
      ),
    );
  }

  void _modalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Consumer<NewPurchaseTransactionViewModel>(
                builder: (context, model, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .60,
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          'Select Party',
                          style: TextStyle(
                              color: HexColor(TEXTCOLOR),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        ToggleSwitch(
                          minWidth: 120.0,
                          minHeight: 40.0,
                          activeBgColor: cprimaryColor,
                          inactiveBgColor: HexColor(SECONDARYGREYCOLOR),
                          activeFgColor: HexColor(TEXTCOLOR),
                          initialLabelIndex: 1,
                          labels: ['Partial', 'Full'],
                          onToggle: (index) {
                            model.setBaType(index);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by Name...',
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.partyList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                child: GestureDetector(
                                  onTap: () {
                                    model.setParty(model.partyList[index].id);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 400,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: HexColor(TEXTCOLOR),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        model.partyList[index].name,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: HexColor(TEXTCOLOR),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                      color: HexColor(SECONDARYGREYCOLOR),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: HexColor(TEXTCOLOR),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Add New',
                                    style: TextStyle(
                                      color: HexColor(SECONDARYGREYCOLOR),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  void _journalConfirmBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (BuildContext contex) {
        return Consumer<NewPurchaseTransactionViewModel>(
          builder: (context, model, child) {
            String _debitLedgerName = model.getDebitSideLedgerName();
            String _creditSideLedgerName = model.getCreditSideLedgerName();
            String _partyName = model.getPartyName();
            String _assetLedgerName = model.getAssetLedgerName();
            int _amount = model.getAmount();

            return Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(model.getDate().toIso8601String()),
                    )
                  ],
                ),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(6),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(3),
                  },
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 1),
                  children: [
                    TableRow(children: [
                      Text('Particulars', textAlign: TextAlign.center),
                      Text(
                        'Credit',
                        textAlign: TextAlign.center,
                      ),
                      Text('Debit', textAlign: TextAlign.center)
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text(
                            // particulars of transaction
                            '$_debitLedgerName Dr.',
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 5,
                        ),
                        Text('To $_creditSideLedgerName',
                            textAlign: TextAlign.center),
                      ]),
                      Column(children: [
                        Text(
                            //debit amount for first ledger
                            '$_amount',
                            textAlign: TextAlign.center),
                        Text(
                            //debit amount fro second ledger
                            '0',
                            textAlign: TextAlign.center),
                      ]),
                      Column(children: [
                        Text(
                            // credit amount for first ledger
                            '0',
                            textAlign: TextAlign.center),
                        Text(
                            // credit amount for second ledger
                            '$_amount',
                            textAlign: TextAlign.center),
                      ]),
                    ]),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Decline',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            );
          },
        );
      },
    );
  }
}
