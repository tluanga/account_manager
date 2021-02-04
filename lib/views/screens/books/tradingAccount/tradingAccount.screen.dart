import 'package:account_manager/business_logic/view_models/books/tradingAccount/tradingAccount.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradingAccountScreen extends StatelessWidget {
  const TradingAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trading Account'),
      ),
      body: Consumer<TradingAccountViewModel>(
        builder: (context, model, child) {
          return Container(
            child: Text('Trading Account'),
          );
        },
      ),
    );
  }
}
