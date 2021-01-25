import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account_manager/business_logic/view_models/books/generalJournal/generalJournal.viewmodel.dart';
import 'package:intl/intl.dart';

class GeneralJournalDashboardScreen extends StatefulWidget {
  const GeneralJournalDashboardScreen({Key key}) : super(key: key);

  @override
  _GeneralJournalDashboardScreenState createState() => _GeneralJournalDashboardScreenState();
}

class _GeneralJournalDashboardScreenState extends State<GeneralJournalDashboardScreen> {
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
                Text('Transaction List', style: TextStyle(fontSize: 20),),
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
                        startDate = endDate.subtract(
                          new Duration(days: endDate.weekday),
                        );
                      }
                      if (value == 3) {
                        startDate = endDate.subtract(
                          new Duration(
                            days: endDate.month,
                          ),
                        );
                      }
                    });
                  },
                ),
                Icon(Icons.calendar_today_outlined),
                Text(
                  DateFormat('dd-MM-yyyy').format(startDate),
                ),
                Text('to'),
                Text(
                  DateFormat('dd-MM-yyyy').format(endDate),
                ),
                Icon(Icons.picture_as_pdf),
                ],
                ),
                Row(
                  children: [
                    Expanded(child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.grey,
                      child: Text('Particulars', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),))),
                    VerticalDivider(width: 3,),
                    Expanded(child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.grey,
                      child: Text(
                        'Amount',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.right,
                        
                      ))), 
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
