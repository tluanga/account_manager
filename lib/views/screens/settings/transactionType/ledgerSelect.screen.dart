import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LedgerSelect extends StatelessWidget {
  const LedgerSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Selection Screen'),
      ),
      body: Consumer<TransactionTypeViewModel>(
          builder: (context, transactiontype, child) {
        return Column(
          children: [
            Text('Number of Transaction Types'),
            Text(
              transactiontype.transactionTypes.length.toString(),
            )
          ],
        );
      }),
    );
  }
}
