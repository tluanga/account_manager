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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger Master Dashboard'),
        backgroundColor: HexColor(PRIMARYCOLOR),
      ),
      body: Container(
        // decoration: BoxDecoration(color: HexColor(SECONDARYGREYCOLOR)),
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
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8,right: 10),
                                width: size.width*0.5,
                                child: Text(
                                  ledgerMaster.ledgerMasterList[index].name ??
                                      'null',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: size.width * 0.18,
                                child: Text(
                                  ledgerMaster.ledgerMasterList[index].party ==
                                          cPartyAc
                                      ? 'Party \nAccount'
                                      : 'Not a Party \nAccount',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: size.width * 0.14),
                              Container(
                                width: size.width * 0.13,
                                child: Text(
                                  ledgerMaster.ledgerMasterList[index]
                                              .directOrIndirect ==
                                          cDirectAc
                                      ? 'Direct \nAccount'
                                      : 'Indirect \nAccount',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
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
