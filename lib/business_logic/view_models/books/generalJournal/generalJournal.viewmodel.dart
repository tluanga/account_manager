import 'package:flutter/foundation.dart';
import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/business_logic/models/transaction.model.dart';

class GeneralJournalViewModel extends ChangeNotifier {
  TransactionService _transactionService = serviceLocator<TransactionService>();
  List<Transaction> transactionList = [];
  void loadData() async {
    transactionList = await _transactionService.getList();
    notifyListeners();
  }
}
