import 'package:account_manager/business_logic/view_models/settings/transactionType/creditSideLedgerSelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/debitSideLedgerSelect.viewmodel.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditSideLedgerSelectScreen extends StatelessWidget {
  final CreditSideLedgerSelectViewModel _model =
      serviceLocator<CreditSideLedgerSelectViewModel>();

  CreditSideLedgerSelectScreen() {
    _model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<DebitSideLedgerSelectViewModel>(
          builder: (context, model, child) {
            model.loadData();
            return Column(
              children: [
                Container(
                  child: Text('Please Select Credit Side Ledger'),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Search'),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: model.ledgerMasterList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              model.setDebitSideLedger(
                                  model.ledgerMasterList[index].id);
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: model.setFillColorDependingOnSelection(
                                      model.ledgerMasterList[index].id),
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(model.ledgerMasterList[index].name),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
