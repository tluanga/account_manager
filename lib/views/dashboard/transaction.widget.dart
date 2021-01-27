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
          padding: EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.lastTenTransactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    var format = new DateFormat("yMMMMd");
                    var dateString =
                        format.format(model.lastTenTransactions[index].date);
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                          height: 50,
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
                                      model.lastTenTransactions[index]
                                          .particular,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
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
                                    Text(
                                      dateString,
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
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
                                ),
                                // Divider(
                                //   height: 1,
                                //   thickness: 1,
                                //   color: Colors.grey.shade400,
                                // ),
                              ],
                            ),
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
