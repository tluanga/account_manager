import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:flutter/foundation.dart';

class TransactionDashboardViewModel extends ChangeNotifier {
  TransactionService _transactionService = serviceLocator<TransactionService>();
  List<Transaction> transactionList = [];
  void loadData() async {
    final _list = await _transactionService.getTransactionList();
    transactionList = _list;
    notifyListeners();
  }
}
