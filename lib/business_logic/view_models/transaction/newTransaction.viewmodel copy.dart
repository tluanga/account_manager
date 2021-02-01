// import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
// import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
// import 'package:account_manager/services/serviceLocator.dart';
// import 'package:account_manager/static/constants.dart';
// import 'package:account_manager/static/ledgerId.constants.dart';
// import 'package:flutter/foundation.dart';

// import 'package:account_manager/services/transactionType/transactionType.service.dart';
// import '../../models/transactionType.models.dart';

// import '../../../services/transaction/transaction.service.dart';
// import '../../models/transaction.model.dart';

// import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
// import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

// class NewTransactionViewModel extends ChangeNotifier {
//   int _amount;
//   int _baOrBalo;
//   int _cashOrBank;
//   DateTime _date;
//   int _debitSideLedgerId;
//   String _debitSideLedgerName;
//   int _creditSideLedgerId;
//   String _creditSideLedgerName;

//   TransactionTypeService _transactionTypeService =
//       serviceLocator<TransactionTypeService>();
//   TransactionService _transactionService = serviceLocator<TransactionService>();
//   LedgerTransactionService _ledgerTransactionService =
//       serviceLocator<LedgerTransactionService>();
//   LedgerMasterService _ledgerMasterService =
//       serviceLocator<LedgerMasterService>();

//   void setBaOrBalo(int data) {
//     baOrBalo = data;
//     notifyListeners();
//   }

//   void setData({
//     int amount,
//     int baOrBalo,
//     int cashOrBank,
//     DateTime date,
//     int transactionTypeId,
//     int partyAccount = 0,
//   }) {
//     _amount = amount;
//     _baOrBalo = baOrBalo;
//     _cashOrBank = cashOrBank;
//     _date = date;
//     //---1--get the transaction type object
//     var _transactionTypeResult = await _transactionTypeService.getList(id: 1);
//     if (_transactionTypeResult == null) {
//       print('Transaction Type access fail');
//     } else
//       print(_transactionTypeResult.toString());
//     TransactionType _transactionType = _transactionTypeResult[0];
//     //----2--Get the debitSide Ledger
//     _debitSideLedgerId = _transactionType.debitSideLedger;

//     //----3--get credit side ledger
//     if (cashOrBank == BANK) {
//       _creditSideLedgerId=LedgerID.BANK ;
//     } else if(cashOrBank==CASH) _creditSideLedgerId=LedgerID.CASHAC;

//   // ---For creating a new transaction
//   void newTransaction({
//     int amount,
//     String particulars,
//     DateTime date,
//     int baOrBalo,
//     int cashOrBank,
//     int transactionTypeId,
//     int partyAccount = 0,
//   } //Ba a thil lei a nih in party ledger account id a ngai
//       ) async {
//     // 1 -- save the transaction
//     var _result = await _transactionService.insert(
//       Transaction(
//         amount: amount,
//         date: DateTime.now(),
//         particular: particulars,
//         baOrBalo: baOrBalo,
//         cashOrBank: cashOrBank,
//         transactionTypeId: transactionTypeId,
//       ),
//     );
//     if (_result != null) {
//       print('New transaction Inserted-$_result');
//     }
//     // 2---Get Transaction type Object
//     var _transactionTypeResult = await _transactionTypeService.getList(id: 1);
//     if (_transactionTypeResult == null) {
//       print('Transaction Type access fail');
//     } else
//       print(_transactionTypeResult.toString());

//     // 3----CREDIT SIDE LEDGER
//     // --------Check for Cash or Bank
//     // -------Get Bank Ledger ID--------
//     TransactionType _transationType = _transactionTypeResult[0];

//     if (cashOrBank == BANK) {
//       LedgerTransaction _ledgerTransactionCreditPayload = LedgerTransaction(
//         ledgerId: 1, //Ledger ID of Bank Ledger is 1
//         amount: amount,
//         particular: particulars,
//         debitOrCredit: CREDIT,
//         date: date,
//       );
//       _ledgerTransactionService.insert(_ledgerTransactionCreditPayload);
//     } else if (cashOrBank == CASH) {
//       LedgerTransaction _ledgerTransactionCreditPayload = LedgerTransaction(
//         ledgerId: _transationType.creditSideLedger,
//         amount: amount,
//         particular: particulars,
//         debitOrCredit: CREDIT,
//         date: date,
//       );
//       _ledgerTransactionService.insert(_ledgerTransactionCreditPayload);
//     }

//     // 4- Create a ledgerTransaction entry for debitSideLedger
//     if (baOrBalo == BALO) {
//       LedgerTransaction _ledgerTransactionDebitPayload = LedgerTransaction(
//         ledgerId: _transationType.debitSideLedger,
//         amount: amount,
//         particular: particulars,
//         debitOrCredit: DEBIT,
//         date: date,
//       );
//       _ledgerTransactionService.insert(_ledgerTransactionDebitPayload);
//     } else if (baOrBalo == BA) {
//       LedgerTransaction _ledgerTransactionDebitPayload = LedgerTransaction(
//         ledgerId: partyAccount,
//         amount: amount,
//         particular: particulars,
//         debitOrCredit: DEBIT,
//         date: date,
//       );
//       _ledgerTransactionService.insert(_ledgerTransactionDebitPayload);
//     }
//   }

//   Future<int> createPartyLedger({name, description}) async {
//     var payload = LedgerMaster(name: name, description: description);
//     var result = await _ledgerMasterService.insert(payload);
//     return result;
//   }
// }
