// import 'package:account_manager/business_logic/view_models/settings/transactionType/ledgerSelect.viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LedgerSelect extends StatefulWidget {
//   @override
//   _LedgerSelectState createState() => _LedgerSelectState();
// }

// class _LedgerSelectState extends State<LedgerSelect> {
//   bool isSearching = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: SafeArea(child: Consumer<LedgerSelectViewModel>(
//       builder: (context, ledger, child) {
//         ledger.loadData();
//         return Stack(children: [
//           CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 floating: false,
//                 pinned: true,
//                 expandedHeight: 250,
//                 backgroundColor: Colors.white,
//                 flexibleSpace: FlexibleSpaceBar(
//                   title: Text(
//                     'Please Select Ledgers',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                 (context, int index) {
//                   if (ledger
//                       .checkLedgerforSelection(ledger.ledgerList[index].id)) {
//                     return GestureDetector(
//                       onTap: () {},
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.teal.shade300,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 ledger.ledgerList[index].name,
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                   return GestureDetector(
//                     onTap: () {
//                       ledger.selectLedgers(ledger.ledgerList[index].id);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.teal.shade300,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               ledger.ledgerList[index].name,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 childCount: ledger.ledgerList.length,
//               )),
//             ],
//           ),
//           Positioned(
//             right: 10,
//             height: 50,
//             left: 10,
//             bottom: 5,
//             child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: FlatButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Submit',
//                       style: TextStyle(color: Colors.white),
//                     ))),
//           )
//         ]);
//       },
//     )));
//   }
// }

// // CustomScrollView(
// //                 slivers: [
// //                   SliverAppBar(
// //                     floating: false,
// //                     pinned: true,
// //                     expandedHeight: 250,
// //                     backgroundColor: Colors.white,
// //                     flexibleSpace: FlexibleSpaceBar(
// //                       title: Text(
// //                         'Please Select Ledgers',
// //                         style: TextStyle(color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// // Expanded(
// //     child: Container(
// //       child: ListView.builder(
// //         itemCount: ledger.ledgerList.length,
// //         itemBuilder: (BuildContext context, int index) {
// //           if (ledger.checkLedgerforSelection(
// //               ledger.ledgerList[index].id)) {
// //             return GestureDetector(
// //               onTap: () {
// //                 ledger
// //                     .deSelectLedger(ledger.ledgerList[index].id);
// //               },
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Container(
// //                   height: 50,
// //                   decoration: BoxDecoration(
// //                     color: Colors.green.shade300,
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Text(ledger.ledgerList[index].name),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }
// //         return GestureDetector(
// //           onTap: () {
// //             ledger.selectLedgers(ledger.ledgerList[index].id);
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
// //                   Text(ledger.ledgerList[index].name),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     ),
// //   ),
// // )
