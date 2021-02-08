import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';

import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:account_manager/views/screens/transaction/common/AssetSelection.screen.dart';
import 'package:account_manager/views/screens/transaction/common/widget/cashOrBankToggle.widget.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../static/transactionType.constant.dart';

class NewInwardReturnTransactionScreen extends StatefulWidget {
  const NewInwardReturnTransactionScreen({Key key}) : super(key: key);

  @override
  _NewInwardReturnTransactionScreenState createState() =>
      _NewInwardReturnTransactionScreenState();
}

class _NewInwardReturnTransactionScreenState
    extends State<NewInwardReturnTransactionScreen> {
  NewPurchaseTransactionViewModel _newPurchaseTransactionViewModel =
      serviceLocator<NewPurchaseTransactionViewModel>();

  final _formKey = GlobalKey<FormState>();

  DateTime _dateTime = DateTime.now();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _journalConfirmBottomSheet(context);
    }
  }

  void setCashOrBank(int index) {
    if (index == CASH) {
      _newPurchaseTransactionViewModel.setCashOrBank(index);
    } else if (index == BANK) {
      _newPurchaseTransactionViewModel.setCashOrBank(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<NewPurchaseTransactionViewModel,
          TransactionTypeSelectViewModel>(
        builder: (context, newTransaction, transactionTypeSelect, child) {
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
                        'Inward Return Transaction',
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
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please Enter Amount';
                        //   }
                        // },
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
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      SelectCashOrBankToggle(),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      Container(
                        child: Text(newTransaction.getPartyName() != null
                            ? newTransaction.getPartyName().toString()
                            : ''),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PartySelectScreen(),
                          //   ),
                          // );
                          if (newTransaction.getTransactionTypeId() ==
                              TransactionTypeConstant.cPURCHASEOFASSET) {
                            print('Asset Type Select');
                            Navigator.of(context)
                                .push(new MaterialPageRoute<Null>(
                                    builder: (BuildContext context) {
                                      return new AssetSelectScreen();
                                    },
                                    fullscreenDialog: true));
                          }
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
                              newTransaction.getTransactionTypeId() == 0
                                  ? 'Please Select Party'
                                  : newTransaction
                                      .getTransactionTypeName()
                                      .toString(),
                              style: TextStyle(
                                color: HexColor(TEXTCOLOR),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          //------Reset Part
                          // transactionTypeSelect.deSelectTransactionType(
                          //     transactionTypeSelect.selectedTransactionType.id);
                          // Navigator.pushNamed(context, rMyApp);
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
                                //  newTransaction.setData();
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
                      SizedBox(height: 10),
                      Container(
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

  void _journalConfirmBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (BuildContext contex) {
        return Consumer<NewPurchaseTransactionViewModel>(
          builder: (context, model, child) {
            String _debitLedgerName = model.getDebitSideLedgerName();
            String _creditSideLedgerName = model.getCreditSideLedgerName();
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
                        'Debit',
                        textAlign: TextAlign.center,
                      ),
                      Text('Credit', textAlign: TextAlign.center)
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
