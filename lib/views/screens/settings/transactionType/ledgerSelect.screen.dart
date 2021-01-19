import 'package:account_manager/business_logic/view_models/ledgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../business_logic/models/transactionType.models.dart';
import '../../../../business_logic/view_models/transactionType.viewmodel.dart';

class LedgerSelect extends StatelessWidget {
  const LedgerSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ledger Selection Screen'),
      ),
      body: Consumer2<LedgerMasterViewModel, TransactionTypeViewModel>(
        builder: (context, ledger, transactionType, child) {
          return Stack(
            children: [
              // Text('Number of Ledger Selecteds'),
              Text(
                transactionType.ledgers.length.toString(),
              ),
              ListView.builder(
                itemCount: ledger.ledgerMasterList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (transactionType
                      .findLedger(ledger.ledgerMasterList[index].id)) {}
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        transactionType.ledgers.add(
                          ledger.ledgerMasterList[index].id,
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            ledger.ledgerMasterList[index].name,
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
