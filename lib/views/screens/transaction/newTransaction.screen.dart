import 'package:account_manager/business_logic/view_models/transaction/newTransaction.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key key}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _formKey = GlobalKey<FormState>();
  int amount;
  String particular;
  int baOrBalo;
  int bankOrCash;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<NewTransactionViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Amount'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Amount';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          amount = int.parse(text);
                        });
                      },
                    ),
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
                          particular = text;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Select Date'),
                    ),
                    ToggleSwitch(
                      minWidth: 120.0,
                      minHeight: 40.0,
                      fontSize: 16.0,
                      initialLabelIndex: 1,
                      labels: ['Ba', 'Balo'],
                      onToggle: (index) {
                        print('switched to: $index');
                        //model.setBaOrBalo(index);
                      },
                    ),
                    ToggleSwitch(
                      minWidth: 120.0,
                      minHeight: 40.0,
                      initialLabelIndex: 0,
                      labels: ['Cash', 'Bank'],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, rTransactionTypeSelect);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Select TransationType',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.teal)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          model.newTransaction(
                              amount: 5000,
                              particulars: 'Thuthleng leina',
                              date: DateTime.now(),
                              baOrBalo: BALO,
                              cashOrBank: CASH);
                        },
                        child: Container(
                          height: 50,
                          width: 420,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
}
