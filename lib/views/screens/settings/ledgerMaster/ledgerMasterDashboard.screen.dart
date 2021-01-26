import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/editLedgerMaster.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LedgerMasterDashboard extends StatelessWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Consumer2<LedgerMasterDashboardViewModel,
                      EditLedgerMasterViewModel>(
                  builder: (context, ledgerMaster, editLedgerMaster, child) {
                ledgerMaster.loadData();
                return ListView.builder(
                  itemCount: ledgerMaster.ledgerMasterList.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return GestureDetector(
                      onTap: () {
                        editLedgerMaster.ledgerMasterForUpdate =
                            ledgerMaster.ledgerMasterList[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditLedgerMasterScreen(
                                ledgerMaster:
                                    ledgerMaster.ledgerMasterList[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ledgerMaster.ledgerMasterList[index].name ??
                                      'null',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(ledgerMaster
                                            .ledgerMasterList[index]
                                            .description ??
                                        'null')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewLedgerMasterScreen()),
          );
        },
        child: Text(
          '+',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
