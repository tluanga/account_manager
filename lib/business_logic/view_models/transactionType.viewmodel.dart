import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeViewModel extends ChangeNotifier {
  List<TransactionType> transactionTypes = [
    TransactionType.widthId(
      id: 1,
      name: 'Purchase of Equipment',
      ledger: [1, 2],
    ),
    TransactionType.widthId(
      id: 2,
      name: 'Purchase of Other Equipments',
      ledger: [1, 2],
    ),
  ];
  List<int> ledgers = [];
  void newTransactionType(int id, String name, String description) {
    var transactionType =
        TransactionType.widthId(id: id, name: name, description: description);
    transactionTypes.add(transactionType);
    notifyListeners();
  }

  void addLedger(TransactionType transactionType, int ledgerID) {
    transactionType.ledger.add(ledgerID);
    notifyListeners();
  }

  bool findLedger(int id) {
    if (ledgers.contains(id)) {
      return true;
    }
    return false;
  }
}
