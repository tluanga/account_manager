import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class LedgerViewModel extends ChangeNotifier {
  List<LedgerTransaction> ledgerTransactionList = [];
  String name = '';

  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();

  void getData({int id, DateTime startDate, DateTime endDate}) async {
    int _startDate = startDate.microsecondsSinceEpoch;
    int _endDate = endDate.microsecondsSinceEpoch;
    ledgerTransactionList = await _ledgerTransactionService.getList(
      id: id,
      startDate: _startDate,
      endDate: _endDate,
    );
  }
}
