import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';

import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransactionType extends StatelessWidget {
  const NewTransactionType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' New Transaction Type'),
      ),
      body: Consumer<NewTransactionTypeViewModel>(
          builder: (context, transactiontype, child) {
        return Column(
          children: [
            // MyTextBox(
            //   title: 'Name',
            // ),
            // MyTextBox(
            //   title: 'Description',
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              transactiontype.countSelectedLedgers().toString(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, rLedgerSelect);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Select Ledgers',
                            style: TextStyle(
                              fontSize: 16,
                            ),
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

            // ListView.builder(
            //     itemCount: transactiontype.getSelectedLedger().length,
            //     itemBuilder: (BuildContext context, int index) {
            //       var ledgerId = transactiontype.getSelectedLedger()[index];
            //       return Text(ledgerId.toString());
            //     }),

            // GestureDetector(
            //   child: Container(
            //     width: 400,
            //     height: 50,
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(20)),
            //     child: Center(
            //       child: Text(
            //         'Submit',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}
