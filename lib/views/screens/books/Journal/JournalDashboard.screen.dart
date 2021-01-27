import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';
import 'package:intl/intl.dart';

class GeneralJournalDashboardScreen extends StatefulWidget {
  const GeneralJournalDashboardScreen({Key key}) : super(key: key);

  @override
  _GeneralJournalDashboardScreenState createState() =>
      _GeneralJournalDashboardScreenState();
}

class _GeneralJournalDashboardScreenState
    extends State<GeneralJournalDashboardScreen> {
  final String ledgerName = 'Ledger Detail';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int valueSelected = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<GeneralJournalViewModel>(
          builder: (context, model, child) {
            model.loadData();
            return Column(
              children: [
                Text(
                  'Transaction List',
                  style: TextStyle(fontSize: 20),
                ),
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
                          child: Text('This Quarter'),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text('This Financial Year'),
                          value: 5,
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
                            startDate = endDate.subtract(
                              new Duration(
                                days: endDate.month,
                              ),
                            );
                          }

                          if (value == 5) {
                            startDate = DateTime(2020, 04, 01);
                          }
                        });
                      },
                    ),
                    Icon(
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(startDate),
                    ),
                    Text('to'),
                    Text(
                      DateFormat('dd/MM/yyyy').format(endDate),
                    ),
                    Icon(
                      Icons.picture_as_pdf,
                        });
                      },
                    ),
                    Icon(Icons.calendar_today_outlined),
                    Text(
                      DateFormat('dd-MM-yyyy').format(startDate),
                    ),
                            padding: EdgeInsets.all(5),
                Expanded(
                      for (model.transactionList[index].date.isAfter(DateTime(2021, 12, 1));
                          model.transactionList[index].date
                              .isBefore(DateTime(2021, 12, 23));) {
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
