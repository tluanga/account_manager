import 'package:account_manager/business_logic/view_models/party/partySelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/static/constants.dart';

import 'package:account_manager/views/screens/transaction/common/transactionTypeSelect.screen.dart';
import 'package:account_manager/views/screens/transaction/common/widget/baOrBaloToggle.widget.dart';
import 'package:account_manager/views/screens/transaction/common/widget/cashOrBankToggle.widget.dart';
import 'package:account_manager/views/screens/transaction/newPurchaseTransaction/newPurchaseTransactionConfirm.modal.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import '../../../../services/serviceLocator.dart';
import '../../../../services/serviceLocator.dart';

class NewPurchaseTransactionScreen extends StatefulWidget {
  const NewPurchaseTransactionScreen({Key key}) : super(key: key);

  @override
  _NewPurchaseTransactionScreenState createState() =>
      _NewPurchaseTransactionScreenState();
}

class _NewPurchaseTransactionScreenState
    extends State<NewPurchaseTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime _dateTime = DateTime.now();
  NewPurchaseTransactionViewModel model =
      serviceLocator<NewPurchaseTransactionViewModel>();
  PartySelectViewModel _partySelectViewModel =
      serviceLocator<PartySelectViewModel>();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<NewPurchaseTransactionViewModel>(context, listen: false)
          .setPurchaseType();

      journalConfirmBottomSheet(context);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<NewPurchaseTransactionViewModel,
          TransactionTypeSelectViewModel, PartySelectViewModel>(
        builder: (context, newTransaction, transactionTypeSelect, partySelect,
            child) {
          String labelText = 'Please Select Transaction Type';
          if (transactionTypeSelect.selectedTransactionType != null) {
            labelText = transactionTypeSelect.selectedTransactionType.name;
          }

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
                      SelectBaOrBaloToggle(
                        context: context,
                      ),
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
                        child: Text(model.getPartyId() != null
                            ? model.getPartyName()
                            : ''),
                      ),
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
                                print('value of partySelect');
                                if (partySelect.selectedParty.id != 0) {
                                  newTransaction
                                      .setPartyId(partySelect.selectedParty.id);
                                  newTransaction.setPartyName(
                                      partySelect.selectedParty.name);
                                  newTransaction.setCreditType(
                                      partySelect.isPartialCredit);
                                }
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
}