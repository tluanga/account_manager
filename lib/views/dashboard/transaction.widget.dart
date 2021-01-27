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
                        vertical: 10,
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.lastTenTransactions[index].particular,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    model.lastTenTransactions[index].amount
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 9,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(dateString),
                                  Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green.shade200,
                                    ),
                                    child: Center(
                                      child: Text('Debit'),
                                    ),
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
