import 'package:account_manager/business_logic/view_models/transaction/newOutwardTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/static/transactionType.constant.dart';
import 'package:account_manager/views/screens/transaction/common/transactionTypeSelect.screen.dart';
import 'package:account_manager/views/screens/transaction/common/widget/cashOrBankToggle.widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewOutwardTransactionScreen extends StatefulWidget {
  @override
  _NewOutwardTransactionScreenState createState() =>
      _NewOutwardTransactionScreenState();
}

class _NewOutwardTransactionScreenState
    extends State<NewOutwardTransactionScreen> {
  NewOutwardTransactionViewModel _newOutwardTransactionViewModel =
      serviceLocator<NewOutwardTransactionViewModel>();

  final _formKey = GlobalKey<FormState>();

  DateTime _dateTime = DateTime.now();

  void setCashOrBank(int index) {
    if (index == CASH) {
      _newOutwardTransactionViewModel.setCashOrBank(index);
    } else if (index == BANK) {
      _newOutwardTransactionViewModel.setCashOrBank(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<NewOutwardTransactionViewModel,
              TransactionTypeSelectViewModel>(
          builder: (context, newTransaction, transactionTypeSelect, child) {
        // String labelText = 'Please Select Transaction Type';
        // if (transactionTypeSelect.selectedTransactionType != null) {
        //   labelText = transactionTypeSelect.selectedTransactionType.name;
        // }
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
                      height: 50,
                    ),
                    Text(
                      'Pekchhuah',
                      style: TextStyle(
                          fontSize: 24,
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
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Amount';
                        }
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionTypeSelectScreen(),
                          ),
                        );
                        if (newTransaction.getTransactionTypeId() ==
                            TransactionTypeConstant.cPURCHASEOFASSET) {
                          print('Asset Type Select');
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
                                ? 'Please Select Transaction Type'
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
                              //  newTransaction.setData();
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
      }),
    );
  }
}
