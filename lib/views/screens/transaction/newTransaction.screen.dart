import 'package:account_manager/business_logic/view_models/transaction/newTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/screens/transaction/transactionTypeSelect.screen.dart';
import 'package:account_manager/views/widgets/toggle.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({Key key}) : super(key: key);

  @override
  _NewTransactionScreenState createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  int _amount;
  String _particular;
  int _baOrBalo;
  int _bankOrCash;
  @override
  Widget build(BuildContext context) {
    return Consumer2<NewTransactionViewModel, TransactionTypeSelectViewModel>(
      builder: (context, newTransaction, transactionTypeSelect, child) {
        String labelText = 'Please Select Transaction Type';
        if (transactionTypeSelect.selectedTransactionType != null) {
          labelText = transactionTypeSelect.selectedTransactionType.name;
        }
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Text(
                  'New Transaction',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
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
                    initialLabelIndex: 1,
                    labels: ['Ba', 'Balo'],
                    onToggle: (index) {
                      _baOrBalo = index;
                    },
                  ),
                ),
                ToggleSwitch(
                  minWidth: 120.0,
                  minHeight: 40.0,
                  initialLabelIndex: 0,
                  labels: ['Cash', 'Bank'],
                  onToggle: (index) {
                    _bankOrCash = index;
                  },
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
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Center(
                      child: Text(labelText),
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
                    Navigator.pushNamed(context, rMyApp);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue),
                      color: Colors.purple.shade500,
                    ),
                    child: Center(
                      child: Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
