import 'package:account_manager/business_logic/view_models/dashboard/ledger_mainDashboard.viewmodel.dart';
import 'package:flutter/material.dart';
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
        return Column(
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
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(model.ledgerMasterListSorted[index].name)
                        ],
                      ),
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
