// import 'package:account_manager/business_logic/view_models/transaction.viewmodel.dart';
// import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:account_manager/views/widgets/my_text_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Transaction'),
        ),
        body: Column(
          children: [
            MyTextBox(
              title: 'Amount',
            ),
            MyTextBox(
              title: 'Description',
            ),
            MyTextBox(
              title: 'Date',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, rTransactionTypeSelect);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Select Transaction Type',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, color: Colors.teal)
                    ],
                  ),
                ),
              ),
            ),
            // Consumer<TransactionTypeViewModel>(
            //   builder: (context, transactionType, model) {
            //     return Consumer<TransactionViewModel>(
            //       builder: (context, transaction, child) {
            //         return Container(
            //           child: Text(transactionType
            //               .transactionTypes[transaction.transactionTypeId].name),
            //         );
            //       },
            //     );
            //   },
            // ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
