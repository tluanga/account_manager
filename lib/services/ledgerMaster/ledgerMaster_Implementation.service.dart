// import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
// import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';

// class LedgerMasterImpl implements LedgerMasterService {
//   List<LedgerMaster> _list = [
//     LedgerMaster(
//         id: 1,
//         name: 'Cash Account',
//         description: 'Every thing related to Cash Transaction'),
//     LedgerMaster(
//       id: 2,
//       name: 'Purchase Account',
//       description: 'Purchase of product by cash',
//     ),
//   ];

//   @override
//   Future<List<LedgerMaster>> getLedgerMasterList() async {
//     return _list;
//   }

//   // Saving new Ledger Master
//   @override
//   Future<void> createNewLedgerMaster(LedgerMaster data) async {
//     _list.add(data);
//   }

//   @override
//   Future<void> updateLedgerMaster(LedgerMaster data) {
//     int _id = data.id;
//     // remove the data from the lost
//     _list.removeWhere((element) => element.id == _id);
//     _list.add(data);
//   }
// }
