import 'package:account_manager/views/screens/transaction/newPurchaseTransaction/widget/newParty.modal.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:provider/provider.dart';

import '../../../../business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import '../../../../static/constants.dart';

class TransactionTypeSelectScreen extends StatelessWidget {
  const TransactionTypeSelectScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewPurchaseTransactionViewModel>(
        builder: (context, model, child) {
          model.loadTransactionType();
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Search Transaction Type....'),
                  onChanged: (value) {
                    model.setTransactionTypeList(value);
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: HexColor(TEXTCOLOR),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: HexColor(SECONDARYGREYCOLOR),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: HexColor(TEXTCOLOR),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          newPartyModal(context);
                        },
                        child: Center(
                          child: Text(
                            'Add New',
                            style: TextStyle(
                              color: HexColor(SECONDARYGREYCOLOR),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.transactionTypeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          model.setTransactionTypeId(model.partyList[index].id);
                          model.setPartyName(model.partyList[index].name);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Center(
                              child:
                                  Text(model.transactionTypeList[index].name),
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
    );
  }
}