import 'package:account_manager/views/screens/settings/accountingYear/editAccountingYear.screen.dart';
import 'package:account_manager/views/widgets/dateSelector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';
import 'package:intl/intl.dart';

class GeneralJournalDashboardScreen extends StatefulWidget {
  @override
  _GeneralJournalDashboardScreenState createState() =>
      _GeneralJournalDashboardScreenState();
}

class _GeneralJournalDashboardScreenState extends State<GeneralJournalDashboardScreen> {
  EditAccountingYear accountingYear;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<GeneralJournalViewModel>(
        builder: (context, model, child) {
          model.loadData();
          return Column(
            children: [
              Text(
                'Transaction List',
                style: TextStyle(fontSize: 20),
              ),
              DateSelector(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.grey,
                      child: Text(
                        'Particulars',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    )
                  ),
                  VerticalDivider(width: 2,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.grey,
                      child: Text(
                        'Amount',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    )
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.transactionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF9F6).withOpacity(1),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              color: Colors.blueGrey[100],
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model.transactionList[index].particular,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.8,
                                      fontSize: 17),
                                ),
                                Text(
                                  model.transactionList[index].amount
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'test',
                                  // model.transactionList[index].date
                                ),
                              ]
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
