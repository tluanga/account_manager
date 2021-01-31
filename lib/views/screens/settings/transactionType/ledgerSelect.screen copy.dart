// import 'package:account_manager/business_logic/view_models/settings/transactionType/ledgerSelect.viewmodel.dart';
// import 'package:account_manager/services/serviceLocator.dart';
// import 'package:account_manager/static/route.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LedgerSelect extends StatelessWidget {
//   final LedgerSelectViewModel _model = serviceLocator<LedgerSelectViewModel>();

//   LedgerSelect() {
//     _model.loadData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     int mode = ModalRoute.of(context).settings.arguments;
//     return Scaffold(
//       body: SafeArea(
//         child: Consumer<LedgerSelectViewModel>(
//           builder: (context, ledger, child) {
//             ledger.loadData();
//             return Column(
//               children: [
//                 Container(
//                   child: Text('Please Select Ledger $mode'),
//                 ),
//                 Container(
//                   child: TextField(
//                     decoration: InputDecoration(hintText: 'Search'),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: ListView.builder(
//                         itemCount: ledger.ledgerList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return LedgerListItem(
//                             id: index,
//                             debitOrCredit: mode,
//                           );
//                         }),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, rNewTransactionType);
//         },
//         child: Container(
//           child: Text('Submit'),
//         ),
//       ),
//     );
//   }
// }

// class LedgerListItem extends StatelessWidget {
//   final debitOrCredit;
//   final Colors fillColor;
//   final int id;

//   LedgerListItem({
//     this.debitOrCredit,
//     this.fillColor,
//     this.id,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, model, child) {
//         return GestureDetector(
//           onTap: () {
//             // model.selectLedgers(ledger.ledgerList[index].id);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.green.shade300,
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(model.ledgerList[id].name),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // class LedgerListItem extends StatelessWidget {
// //   final debitOrCredit;
// //   final Colors fillColor;
// //   final int id;

// //   LedgerListItem({
// //     this.debitOrCredit,
// //     this.fillColor,
// //     this.id,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     Consumer<LedgerSelectViewModel>(
// //       builder: (context, model, child) {
// //         return GestureDetector(
// //           onTap: () {
// //             // model.selectLedgers(ledger.ledgerList[index].id);
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Container(
// //               height: 50,
// //               decoration: BoxDecoration(
// //                 border: Border.all(
// //                   color: Colors.green.shade300,
// //                 ),
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(model.ledgerList[id].name),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
