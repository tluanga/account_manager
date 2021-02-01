import 'package:flutter/material.dart';

class CustomerDebtSettlementDashboard extends StatelessWidget {
  const CustomerDebtSettlementDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Debt Settlement'),
      ),
      body: Text('Debt Settlement Dashboard'),
    );
  }
}
