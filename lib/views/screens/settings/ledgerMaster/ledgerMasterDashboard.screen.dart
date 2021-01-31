import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/editLedgerMaster.screen.dart';
import 'package:account_manager/views/screens/settings/ledgerMaster/newLedgerMaster.screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class LedgerMasterDashboard extends StatelessWidget {
  const LedgerMasterDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
        backgroundColor: HexColor(PRIMARYCOLOR),
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor(SECONDARYGREYCOLOR)),
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
                            color: Color(0xFFFFF9F6).withOpacity(1),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 2,
                                color: Colors.blueGrey[100],
                              )
                            ],
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
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Text(
                                    ledgerMaster.ledgerMasterList[index]
                                                .party ==
                                            cPartyAc
                                        ? 'Party Account'
                                        : 'Not a Party Account',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Text(
                                    ledgerMaster.ledgerMasterList[index]
                                                .directOrIndirect ==
                                            cDirectAc
                                        ? 'Direct Account'
                                        : 'Indirect Account',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
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
