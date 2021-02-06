import 'package:account_manager/business_logic/view_models/dashboard/ledger_mainDashboard.viewmodel.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class PartiesDashBoardScreen extends StatefulWidget {
  @override
  _PartiesDashBoardScreenState createState() => _PartiesDashBoardScreenState();
}

class _PartiesDashBoardScreenState extends State<PartiesDashBoardScreen> {
  String text = 'To be Displayed';

  bool shouldDisplay = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LedgerMainDashboardViewModel>(
      builder: (context, model, child) {
        return Container(
          child: Column(
            children: [
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.add),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          shouldDisplay = !shouldDisplay;
                        });
                      },
                      child: Text('Add Parties')),
                ]),
              ),
              shouldDisplay ? Text(text) : Spacer(),
              Expanded(
                child: ListView.builder(
                    itemCount: model.ledgerMasterListSorted.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor(PRIMARYCOLOR),
                            ),
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(model.ledgerMasterListSorted[index].name)
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
