import 'package:account_manager/business_logic/view_models/dashboard/ledger_mainDashboard.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LedgerDashboardScreen extends StatelessWidget {
  const LedgerDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Consumer<LedgerMainDashboardViewModel>(
            builder: (context, model, child) {
              return model.loadingData
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: model.ledgerMasterListSorted.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(children: [
                                Text(
                                  model.ledgerMasterListSorted[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Debit:1121212'),
                                    Text('Credit:121212'),
                                  ],
                                )
                              ]),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
