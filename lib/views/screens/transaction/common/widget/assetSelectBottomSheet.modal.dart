//   import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../../business_logic/view_models/settings/assetAccount/assetSelect.viewmodel.dart';

// void assetTypeModalBottomSheet(context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Consumer<AssetSelectViewModel>(
//           builder: (context, baOrBalo, child) {
//             final BoxDecoration _activeBoxDecoration = BoxDecoration(
//               border: Border.all(
//                 color: Colors.yellow.shade700,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(7),
//             );
//             final BoxDecoration _inActiveBoxDecoration = BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey.shade700,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(7),
//             );
//             final TextStyle _activeTextStyle = TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             );
//             final TextStyle _inActiveTextStyle = TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             );
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       // onChanged: (value) => {
//                       //   baOrBalo.setAmountBankOrCash(
//                       //     int.parse(value),
//                       //   )
//                       // },
//                       decoration: InputDecoration(
//                           labelText: 'Amount for Bank/Cash A/c'),
//                       keyboardType: TextInputType.number,
//                     ),
//                     SizedBox(height: 26),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Container(child: Text('test'),)
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
