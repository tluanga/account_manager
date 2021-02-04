import 'package:account_manager/business_logic/view_models/books/trialBalance/trialBalance.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
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
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
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
                                startDate = new DateTime(
                                    endDate.year, endDate.month, 1);
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
                                'Debit',
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
                                'Credit',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ))),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.trialBalanceElements.length,
                      itemBuilder: (BuildContext context, int index) {
                        String _debitValue = '';
                        String _creditValue = '';
                        Color _colorCredit;
                        Color _colorDebit;
                        if (model.trialBalanceElements[index].debitOrCredit ==
                            CREDIT) {
                          _creditValue = model
                              .trialBalanceElements[index].amount
                              .toString();
                          _colorCredit = Colors.red.shade200;
                        } else {
                          _debitValue = model.trialBalanceElements[index].amount
                              .toString();
                          _colorDebit = Colors.green.shade500;
                        }

                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  // color: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      model.trialBalanceElements[index]
                                          .ledgerName,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.green,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Center(
                                    child: Text(
                                      _debitValue,
                                      style: TextStyle(color: _colorDebit),
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.red,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      _creditValue,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: _colorCredit),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          alignment: Alignment.centerRight,
                          child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold),)
                        ), 
                        Container(
                          child: Text('10000'),
                          width: MediaQuery.of(context).size.width*0.3,
                          alignment: Alignment.centerRight
                        ), 
                        Container(
                          child: Text('2000'),
                          width: MediaQuery.of(context).size.width*0.3,
                          alignment: Alignment.centerRight
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
