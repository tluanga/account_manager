// import 'package:account_manager/business_logic/view_models/transaction/newTransaction.viewmodel.dart';
// import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
// import 'package:account_manager/static/route.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:toggle_switch/toggle_switch.dart';

// class NewTransaction extends StatefulWidget {
//   const NewTransaction({Key key}) : super(key: key);

//   @override
//   _NewTransactionState createState() => _NewTransactionState();
// }

// class _NewTransactionState extends State<NewTransaction> {
//   final _formKey = GlobalKey<FormState>();
//   int _amount;
//   String _particular;
//   int _baOrBalo;
//   int _bankOrCash;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Consumer2<NewTransactionViewModel, TransactionTypeSelectViewModel>(
//         builder: (context, model, transactionTypeSelect, child) {
//           String labelTransactionTypeSelect = 'Please Select Transaction Type';
//           if (transactionTypeSelect.selectedTransactionType != null) {}

//           return Scaffold(
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         'New Transaction',
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(labelText: 'Amount'),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please Enter Amount';
//                           }
//                           return null;
//                         },
//                         onChanged: (text) {
//                           setState(() {
//                             _amount = int.parse(text);
//                           });
//                         },
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(labelText: 'Particulars'),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please Enter Particular';
//                           }
//                           return null;
//                         },
//                         onChanged: (text) {
//                           setState(() {
//                             _particular = text;
//                           });
//                         },
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(labelText: 'Select Date'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ToggleSwitch(
//                           minWidth: 120.0,
//                           minHeight: 40.0,
//                           fontSize: 16.0,
//                           initialLabelIndex: 1,
//                           labels: ['Ba', 'Balo'],
//                           onToggle: (index) {
//                             _baOrBalo = index;
//                           },
//                         ),
//                       ),
//                       ToggleSwitch(
//                         minWidth: 120.0,
//                         minHeight: 40.0,
//                         initialLabelIndex: 0,
//                         labels: ['Cash', 'Bank'],
//                         onToggle: (index) {
//                           _bankOrCash = index;
//                         },
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     TransactionTypeSelectViewModel()),
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             height: 50,
//                             width: 400,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.teal),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Center(
//                                     child: Text(
//                                       labelTransactionTypeSelect,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 Icon(Icons.arrow_forward_ios_outlined,
//                                     color: Colors.teal)
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             model.newTransaction(
//                               amount: _amount,
//                               particulars: _particular,
//                               date: DateTime.now(),
//                               baOrBalo: 1,
//                               cashOrBank: 1,
//                             );
//                             Navigator.pushNamed(context, rMyApp);
//                           },
//                           child: Container(
//                             height: 50,
//                             width: 420,
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'Submit',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
