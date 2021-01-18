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
      id: 1,
      name: 'Purchase of Other Equipments',
      ledger: [1, 2],
    ),
  ];
  List<int> ledgers = [];
  void newTransactionType(int id, String name, String description) {
    var transactionType =
        TransactionType.widthId(id: id, name: name, description: description);
    transactionTypes.add(transactionType);
  }

  void addLedger(TransactionType transactionType, int ledgerID) {
    transactionType.ledger.add(ledgerID);
  }
}
