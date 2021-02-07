import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/foundation.dart';

import '../../../../services/ledgerTransaction/ledgerTransaction.service.dart';

class LedgerViewModel extends ChangeNotifier {
  int debit = 0;
  int credit = 0;
  List<LedgerTransaction> ledgerTransactionList;
  String name = '';
  bool isLoading;

  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();

  void getData({int id, DateTime startDate, DateTime endDate}) async {
    int _startDate = startDate.microsecondsSinceEpoch;
    int _endDate = endDate.microsecondsSinceEpoch;
    print('inside view model');
    print(id.toString());
    isLoading = true;
    ledgerTransactionList = await _ledgerTransactionService.getList(
      id: id,
      startDate: _startDate,
      endDate: _endDate,
    );
    for (int i = 0; i < ledgerTransactionList.length; i++) {
      if (ledgerTransactionList[i].debitOrCredit == DEBIT) {
        debit += ledgerTransactionList[i].amount;
      } else if (ledgerTransactionList[i].debitOrCredit == CREDIT) {
        credit += ledgerTransactionList[i].amount;
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
