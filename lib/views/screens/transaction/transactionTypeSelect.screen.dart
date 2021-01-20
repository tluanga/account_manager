import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionTypeSelect extends StatelessWidget {
  const TransactionTypeSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Type Select'),
      ),
      body: Column(
        children: [
          Text('Please Select Transaction Type'),
          Expanded(
            child: Consumer<TransactionTypeSelectViewModel>(
              builder: (context, transactionType, child) {
                transactionType.loadData();
                return Text('Test');
                // return ListView.builder(
                //   itemCount: transactionType.transactionTypes.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     if (transactionType.checkTransactionTypeForSelection(
                //         transactionType.transactionTypes[index].id)) {
                //       return GestureDetector(
                //         onTap: () {
                //           transactionType.deSelectTransactionType(
                //               transactionType.transactionTypes[index].id);
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Container(
                //             height: 50,
                //             decoration: BoxDecoration(
                //               color: Colors.green.shade300,
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(transactionType
                //                     .transactionTypes[index].name),
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     }
                //     return GestureDetector(
                //       onTap: () {
                //         transactionType.setTransactionType(
                //             transactionType.transactionTypes[index].id);
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Container(
                //           height: 50,
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Colors.green.shade300,
                //             ),
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                   transactionType.transactionTypes[index].name),
                //             ],
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
            ),
          )
        ],
      ),
    );
  }
}
