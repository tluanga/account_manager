import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import '../../myApp.screen.dart';

void journalConfirmBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: false,
    context: context,
    builder: (BuildContext contex) {
      return Consumer<NewPurchaseTransactionViewModel>(
        builder: (context, model, child) {
          model.printData();
          return Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('date'),
                  )
                ],
              ),
              Expanded(
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(6),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(3),
                  },
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 1),
                  children: [
                    TableRow(children: [
                      Text('Particulars', textAlign: TextAlign.center),
                      Text(
                        'Debit',
                        textAlign: TextAlign.center,
                      ),
                      Text('Credit', textAlign: TextAlign.center)
                    ]),
                    TableRow(children: [
                      Row(
                        children: [
                          Text(model.getDebitSideLedgerName()),
                          Text(
                            // particulars of transaction
                            ' Dr.',
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Text(
                          //debit amount for first ledger
                          model.getAmount().toString(),
                          textAlign: TextAlign.center),
                      Text(
                          // credit amount for first ledger
                          '0',
                          textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Row(
                        children: [
                          Text(
                            model.getCreditSideLedgerName(),
                          ),
                          Text('To ', textAlign: TextAlign.center),
                        ],
                      ),
                      Text(
                          //debit amount fro second ledger
                          '0',
                          textAlign: TextAlign.center),
                      Text(
                          // credit amount for second ledger
                          model.getAmount().toString(),
                          textAlign: TextAlign.center),
                    ]),
                    model.getPartyId() != model.getCreditSideLedgerID() &&
                            model.getPartyId() != model.getDebitSideLedgerId()
                        ? TableRow(children: [
                            Row(
                              children: [
                                Text(
                                  model.getPartyName(),
                                ),
                                Text('To ', textAlign: TextAlign.center),
                              ],
                            ),
                            Text(
                                //debit amount fro second ledger
                                '0',
                                textAlign: TextAlign.center),
                            Text(
                                // credit amount for second ledger
                                model.getAmount().toString(),
                                textAlign: TextAlign.center),
                          ])
                        : TableRow(children: [
                            Row(
                              children: [
                                Text(
                                  '',
                                ),
                                Text('', textAlign: TextAlign.center),
                              ],
                            ),
                            Text(
                                //debit amount fro second ledger
                                '',
                                textAlign: TextAlign.center),
                            Text(
                                // credit amount for second ledger
                                '',
                                textAlign: TextAlign.center),
                          ])
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        model.saveData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Decline',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        },
      );
    },
  );
}