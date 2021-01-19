import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeSelect extends StatelessWidget {
  const TransactionTypeSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Transaction Type Select'),
        ),
        body: Container(
          child: Text('test'),
        ));
  }
}
