import 'package:account_manager/views/screens/settings/accountingYear/editAccountingYear.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';
import 'package:intl/intl.dart';

class GeneralJournalDashboardScreen extends StatefulWidget {
  @override
  _GeneralJournalDashboardScreenState createState() =>
      _GeneralJournalDashboardScreenState();
}

class _GeneralJournalDashboardScreenState
    extends State<GeneralJournalDashboardScreen> {
  EditAccountingYear accountingYear;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int valueSelected = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaction List',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Consumer<GeneralJournalViewModel>(
          builder: (context, model, child) {
            model.loadData();
            return Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                        value: valueSelected,
                        items: [
                          DropdownMenuItem(
                            child: Text('Today'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('This Week'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('This Month'),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text('This Financial Year'),
                            value: 4,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            valueSelected = value;
                            if (value == 1) {
                              startDate = DateTime.now();
                            }
                            if (value == 2) {
                              startDate = DateTime.now().subtract(
                                  Duration(days: DateTime.now().weekday));
                            }
                            if (value == 3) {
                              startDate =
                                  new DateTime(endDate.year, endDate.month, 1);
                            }
                            if (value == 4) {
                              startDate = DateTime(startDate.year, 01, 01);
                            }
                          });
                        },
                      ),
                      Icon(Icons.calendar_today_outlined),
                      Text(
                        DateFormat('dd/MM/yyyy').format(startDate),
                      ),
                      Text('to'),
                      Text(
                        DateFormat('dd/MM/yyyy').format(endDate),
                      ),
                      Icon(
                        Icons.picture_as_pdf,
                      )
                    ]),
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
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.grey,
                            child: Text(
                              'Amount',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ))),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.transactionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(model.transactionList[index].particular);
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                  Text(
                                    model.transactionList[index].amount
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Debit:'),
                                      Text(
                                        model.transactionList[index]
                                                    .creditSideLedgerName !=
                                                null
                                            ? model.transactionList[index]
                                                .debitSideLedgerName
                                            : '',
                                      ),
                                    ],
                                  ),
                                  model.transactionList[index].partyName !=
                                              null &&
                                          model.transactionList[index]
                                                  .partyName !=
                                              model.transactionList[index]
                                                  .creditSideLedgerName &&
                                          model.transactionList[index]
                                                  .partyName !=
                                              model.transactionList[index]
                                                  .debitSideLedgerName
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                              Text('Party:'),
                                              Text(model.transactionList[index]
                                                  .partyName)
                                            ])
                                      : Container(),
                                  Row(
                                    children: [
                                      Text('Credit:'),
                                      Text(
                                        model.transactionList[index]
                                                    .creditSideLedgerName !=
                                                null
                                            ? model.transactionList[index]
                                                .creditSideLedgerName
                                            : '',
                                      ),
                                    ],
                                  )
                                ],
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
        ),
      ),
    );
  }
}
