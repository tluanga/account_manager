import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
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
              child: Consumer<LedgerMasterDashboardViewModel>(
                  builder: (context, model, child) {
                model.loadData();
                return ListView.builder(
                  itemCount: model.ledgerMasterList.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to edit the ledger master
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
                                  model.ledgerMasterList[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(model
                                        .ledgerMasterList[index].description)),
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
