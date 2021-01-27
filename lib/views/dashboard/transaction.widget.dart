import 'package:account_manager/business_logic/view_models/dashboard/dashboard.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                    var format = new DateFormat("yMMMMd");
                    var dateString =
                        format.format(model.lastTenTransactions[index].date);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue.shade400,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(model
                                      .lastTenTransactions[index].particular),
                                  Text(
                                    model.lastTenTransactions[index].amount
                                        .toString(),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(dateString),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade200,
                                    ),
                                    child: Text('Debit'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
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
