import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import '../../models/transactionType.models.dart';

import '../../../services/transaction/transaction.service.dart';
import '../../models/transaction.model.dart';

import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

class NewTransactionViewModel extends ChangeNotifier {
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  TransactionService _transactionService = serviceLocator<TransactionService>();
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();

  // ---For creating a new transaction
  void newTransaction(
    int _amount,
    String _particulars,
    int _baOrBalo,
    int _cashOrBank,
    int _transactionTypeId,
  ) async {
    // 1 -- save the transaction
    var _result = await _transactionService.insert(Transaction(
        amount: _amount,
        particular: _particulars,
        baOrBalo: _baOrBalo,
        cashOrBank: _cashOrBank,
        transactionTypeId: _transactionTypeId));
    if (_result != null) {
      print('New transaction Inserted-$_result');
    }
    // 2---Get Transaction type Object
    var _transactionTypeResult =
        await _transactionTypeService.getList(id: _transactionTypeId);
    if (_transactionTypeResult == null) {
      print('Transaction Type access fail');
    } else
      print(_transactionTypeResult.toString());

    // 3- Create a ledgerTransaction entry for debitSideLedger
    TransactionType _transationType = _transactionTypeResult[0];
    LedgerTransaction _ledgerTransactionPayload = LedgerTransaction(
      ledgerId: _transationType.id,
      amount: _amount,
      particular: _particulars,
      debitOrCredit: 0,
      cashOrBank: 0,
    );

    var _ledgerTransactionInserResult =
        _ledgerTransactionService.insert(_ledgerTransactionPayload);
    if (_ledgerTransactionInserResult != null) {
      print('New  Ledger transaction Inserted-$_result');
    } else
      print('error');
  }

  // int getSelectedTransactionType() {
  //   return selectedTransactionType;
  // }

  // String getSelectedTransactionTypeName() {
  //   int id = selectedTransactionType;
  //   print(id);
  //   TransactionType temp = searchTransactionType(id);

  //   return temp.name;
  //   // -----Get the name of the transaction Type
  // }
}
