import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:flutter/foundation.dart';

class DashboardViewModel extends ChangeNotifier {
  List<Transaction> lastTenTransactions = [];
  TransactionService _transactionService = serviceLocator<TransactionService>();

  void loadData() async {
    // -Todo-- Sevice needs to modify to gel only the last 10 transactions
    lastTenTransactions = await _transactionService.getList();

    print(lastTenTransactions.length.toString());
    notifyListeners();
  }

  void getTotalTransactionForTheMonth() {
    _transactionService.creditAmountForMonth();
  }
}
