import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/party/partyDashboard.viewmodel.dart';
import 'package:account_manager/views/screens/settings/party/editParty.screen.dart';
import 'package:account_manager/views/screens/settings/party/newParty.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartyDashboardScreen extends StatelessWidget {
  const PartyDashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Party Dashboard'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child:
                  Consumer2<PartyDashboardViewModel, EditLedgerMasterViewModel>(
                      builder: (context, party, editLedgerMaster, child) {
                party.loadData();
                return ListView.builder(
                  itemCount: party.partyList.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditPartyScreen(party: party.partyList[index]),
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
                                  party.partyList[index].name ?? 'null',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                    child: Text(
                                  party.partyList[index].description ?? 'null',
                                  textAlign: TextAlign.right,
                                )),
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
            MaterialPageRoute(builder: (context) => NewPartyScreen()),
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
