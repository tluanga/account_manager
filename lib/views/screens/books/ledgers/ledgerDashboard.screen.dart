import 'package:flutter/material.dart';
import 'package:account_manager/business_logic/view_models/books/ledger/ledgerDashboard.viewmodel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../../static/constants.dart';
import 'ledger.screen.dart';

class LedgerDashboard extends StatelessWidget {
  const LedgerDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ledger Dashboard'),
        ),
        body: Consumer<LedgerDashboardViewmodel>(
          builder: (context, model, child) {
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Search Ledger..',
                      ),
                      onChanged: (value) {
                        model.searchLedgerMaster(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.ledgerMasterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LedgerScreen(
                                      ledger: model.ledgerMasterList[index]),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: HexColor(PRIMARYCOLOR),
                                    ),
                                    child: Center(
                                      child: Text(
                                        model.ledgerMasterList[index].name,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      child: Text(
                                        model.ledgerMasterList[index]
                                            .description,
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
