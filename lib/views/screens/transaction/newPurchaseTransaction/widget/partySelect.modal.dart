import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';

class PartySelect extends StatelessWidget {
  const PartySelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewPurchaseTransactionViewModel>(
        builder: (context, model, child) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Search Party....'),
                  onChanged: (value) {
                    model.getFilterdPartyLedgerMaster(value);
                  },
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.partyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          model.setPartyId(model.partyList[index].id);
                          Navigator.pop(context);
                        },
                        child: ListTile(
                          title: Text(model.partyList[index].name),
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
    );
  }
}

class HexColor {}
