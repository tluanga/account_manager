import 'package:account_manager/business_logic/view_models/settings/transactionType/ledgerSelect.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LedgerSelect extends StatelessWidget {
  const LedgerSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LedgerSelectViewModel>(
          builder: (context, ledger, child) {
            ledger.loadData();
            return Stack(
              children: [
                Text(
                  ledger.countSelectedLedgers().toString(),
                ),
                ListView.builder(
                  itemCount: ledger.ledgerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (ledger
                        .checkLedgerforSelection(ledger.ledgerList[index].id)) {
                      return GestureDetector(
                        onTap: () {
                          ledger.deSelectLedger(ledger.ledgerList[index].id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(ledger.ledgerList[index].name),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        ledger.selectLedgers(ledger.ledgerList[index].id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green.shade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(ledger.ledgerList[index].name),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, rNewTransactionType);
                  },
                  child: Container(
                    child: Text('Submit'),
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
