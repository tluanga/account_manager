import 'package:account_manager/business_logic/view_models/dashboard/dashboard.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionDashboardWidget extends StatelessWidget {
  const TransactionDashboardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (context, model, child) {
        model.loadData();
        print(
          model.lastTenTransactions.length.toString(),
        );
        return Container(
          child: Column(
            children: [
              Text('Last 10 Transactions'),
              Expanded(
                child: ListView.builder(
                  itemCount: model.lastTenTransactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Text('data'),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
