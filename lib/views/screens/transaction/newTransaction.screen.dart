// import 'package:account_manager/static/route.dart';
// import 'package:flutter/material.dart';

// class NewTransaction extends StatelessWidget {
//   const NewTransaction({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Transaction'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, rTransactionTypeSelect);
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Text(
//                         'Select Transaction Type',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Consumer<TransactionTypeViewModel>(
//           //   builder: (context, transactionType, model) {
//           //     return Consumer<TransactionViewModel>(
//           //       builder: (context, transaction, child) {
//           //         return Container(
//           //           child: Text(transactionType
//           //               .transactionTypes[transaction.transactionTypeId].name),
//           //         );
//           //       },
//           //     );
//           //   },
//           // ),
//           SizedBox(height: 20),
//           GestureDetector(
//             child: Container(
//               width: 400,
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: Center(
//                 child: Text(
//                   'Submit',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
