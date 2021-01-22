import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

import 'package:account_manager/services/ledgerTransaction/ledgeMaster.service.dart';

class LedgerTransactionImpl implements LedgerTransactionService {
  List<LedgerTransaction> _list = [
    LedgerTransaction(
      id: 1,
      ledgerId: 1,
      date: DateTime.now(),
      amount: 100,
      debitOrCredit: 1,
    ),
  ];
  @override
  Future<void> createNewLedgerTransaction(LedgerTransaction data) async {
    _list.add(data);
  }

  @override
  Future<List<LedgerTransaction>> getLedgerTransactionList() async {
    return _list;
  }
}
