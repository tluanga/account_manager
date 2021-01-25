import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';

class GeneralJournalDashboardScreen extends StatelessWidget {
  const GeneralJournalDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<GeneralJournalViewModel>(
          builder: (context, model, child) {
            model.loadData();
            return Column(
              children: [
                Text('Transaction List'),
                Row(
                  children: [
                    Text('Month'),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.transactionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(model.transactionList[index].particular),
                                  Text(
                                    model.transactionList[index].amount
                                        .toString(),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text('test'
                                      // model.transactionList[index].date
                                      //     .toIso8601String(),
                                      ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
