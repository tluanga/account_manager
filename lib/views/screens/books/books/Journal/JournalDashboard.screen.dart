// import 'package:account_manager/business_logic/view_models/transaction/transactionDashboard.viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class GeneralJournalDashboardScreen extends StatelessWidget {
//   const GeneralJournalDashboardScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Consumer<TransactionDashboardViewModel>(
//           builder: (context, model, child) {
//             model.loadData();
//             return Column(
//               children: [
//                 Text('Transaction List'),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: model.transactionList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: EdgeInsets.all(8),
//                         child: Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.orange,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(model.transactionList[index].particular),
//                                   Text(
//                                     model.transactionList[index].amount
//                                         .toString(),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     model.transactionList[index].date
//                                         .toIso8601String(),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
