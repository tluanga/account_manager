import 'package:account_manager/business_logic/models/party.model.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
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
  int _amount;
  String _particular;
  int _baOrBalo;
  int _bankOrCash;
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
                      onChanged: (text) {
                        setState(() {
                          _amount = int.parse(text);
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
                      onChanged: (text) {
                        setState(() {
                          _particular = text;
                        });
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
                          _baOrBalo = index;
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
                        _bankOrCash = index;
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
                                  setState(() {
                                    _dateTime = date;
                                  });
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
                            builder: (context) => TransactionTypeSelectScreen(),
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
                        newTransaction.newTransaction(
                          amount: _amount,
                          particulars: _particular,
                          baOrBalo: _baOrBalo,
                          cashOrBank: _bankOrCash,
                          transactionTypeId:
                              transactionTypeSelect.selectedTransactionType.id,
                        );

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
                              _journalConfirmBottomSheet(context);
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
                            model.setBAType(index);
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
                                height: 20,
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
          return Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Date : 31/01/2021'),
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
                          'Purchase Account Dr.',
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 5,
                      ),
                      Text('To Sales Account', textAlign: TextAlign.center),
                    ]),
                    Column(children: [
                      Text(
                          //debit amount for first ledger
                          '5000',
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
                          '5000',
                          textAlign: TextAlign.center),
                    ]),
                  ]),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal:8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Particulars'),
              //       SizedBox(),
              //       Text('debit'),
              //       Text('credit'),
              //     ],
              //   ),
              // ),
              // Divider(color: Colors.black,),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8,),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         width: MediaQuery.of(context).size.width*0.35,
              //         child: Text('This is an example to demostrate if the particulars contain a large number of words ')
              //       ),
              //       Text(_amount.toString()),
              //       Text('null'),
              //     ],
              //   ),
              // ),
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
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}
