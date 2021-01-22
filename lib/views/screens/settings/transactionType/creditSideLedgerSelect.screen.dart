import 'package:account_manager/business_logic/view_models/settings/transactionType/creditSideLedgerSelect.viewmodel.dart';
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
        child: Consumer<CreditSideLedgerSelectViewModel>(
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
                Container(
                  child: Text(
                    model.getCreditSideLedger(),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: model.ledgerList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              model.setCreditSideLedger(
                                  model.ledgerList[index].id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: model.setFillColorDependingOnSelection(
                                      model.ledgerList[index].id),
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(model.ledgerList[index].name),
                                    Text(model.ledgerList[index].description),
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
