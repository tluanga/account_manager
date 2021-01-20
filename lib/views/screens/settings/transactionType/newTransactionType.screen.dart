import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/static/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransactionType extends StatelessWidget {
  const NewTransactionType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewTransactionTypeViewModel>(
        builder: (context, transactionType, child) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Container(
                    child: Center(
                      child: Text(
                        'New Transaction Type',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, rLedgerSelect);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green.shade300,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Select Debit Side Ledger'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, rLedgerSelect);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green.shade300,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Select Credit Side Ledger'),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      rTransactionTypeDashboard,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 420,
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
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
          );
          // return Stack(
          //   children: [
          //     Text(
          //       transactionType.getSelectedLedger().length.toString(),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(context, rLedgerSelect);
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.all(15.0),
          //         child: Container(
          //           padding: EdgeInsets.symmetric(horizontal: 20),
          //           height: 50,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.teal),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Expanded(
          //                 child: Center(
          //                   child: Text(
          //                     'Select Ledgers',
          //                     style: TextStyle(
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 20,
          //               ),
          //               Icon(Icons.arrow_forward_ios_outlined,
          //                   color: Colors.teal)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
