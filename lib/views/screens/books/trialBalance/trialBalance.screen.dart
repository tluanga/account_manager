import 'package:account_manager/business_logic/view_models/books/trialBalance/trialBalance.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrialBalanceScreen extends StatefulWidget {
  TrialBalanceScreen({Key key}) : super(key: key);

  @override
  _TrialBalanceScreenState createState() => _TrialBalanceScreenState();
}

class _TrialBalanceScreenState extends State<TrialBalanceScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int valueSelected = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TrialBalanceViewModel>(
        builder: (context, model, child) {
          model.loadData();

          return Scaffold(
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Trial Balance',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.picture_as_pdf,
                      ),
                    ),
                  ],
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
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            color: Colors.cyan[50],
                            child: Text(
                              'Particulars',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ))),
                    VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            color: Colors.cyan[50],
                            child: Text(
                              'Credit/Debit',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ))),
                    VerticalDivider(
                      width: 2,
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            color: Colors.cyan[50],
                            child: Text(
                              'Amount',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ))),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sale( + )',
                          style: TextStyle(color: Colors.grey[700])),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Debit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '5000.00',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Purchase( - )',
                          style: TextStyle(color: Colors.grey[700])),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'credit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '2000.00',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.trialBalanceElements.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Text(
                          model.trialBalanceElements[index].amount.toString(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
