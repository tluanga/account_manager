import 'package:account_manager/business_logic/view_models/books/ledger/ledger.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/settings/accountingYear/editAccountingYear.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Ledger extends StatefulWidget {
  final int ledgerId;
  Ledger({Key key, this.ledgerId}) : super(key: key);

  @override
  _LedgerState createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  EditAccountingYear accountingYear;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int valueSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ledger Name',
          style: TextStyle(
            color: HexColor(TEXTCOLOR),
            fontSize: 15,
          ),
        ),
      ),
      body: Consumer<LedgerViewModel>(
        builder: (context, model, child) {
          model.getData(
            id: widget.ledgerId,
            startDate: DateTime.now(),
            endDate: DateTime.now(),
          );

          return SafeArea(
            child: Scaffold(
              body: Column(
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
                              ))),
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
                  Container(
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: model.ledgerTransactionList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(model.ledgerTransactionList[index]
                                          .particular),
                                      Text(
                                        model
                                            .ledgerTransactionList[index].amount
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(model.ledgerTransactionList[index]
                                          .cashOrBank
                                          .toString())
                                    ],
                                  ),
                                  Divider(
                                    thickness: 5,
                                    color: Colors.grey.shade200,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
