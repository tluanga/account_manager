import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeSelectScreen extends StatelessWidget {
  const TransactionTypeSelectScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TransactionTypeSelectViewModel>(
        builder: (context, model, child) {
          model.loadData();
          return Column(
            children: [
              Text('Please select Transaction Type'),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.transactionTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (model.selectedTransactionType == null) {
                          model.selectedTransactionType =
                              model.transactionTypeList[index];
                          Navigator.pop(context);
                        } else {
                          model.selectedTransactionType =
                              model.transactionTypeList[index];
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                              model.transactionTypeList[index].name,
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
