import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeViewModel extends ChangeNotifier {
  List<TransactionType> transactionTypes = [];

  // void loadData() {
  //   transactionTypes = transactionTypesData;
  // }

  // List<int> ledgers = [];
  // void newTransactionType(int id, String name, String description) {
  //   var transactionType =
  //       TransactionType.widthId(id: id, name: name, description: description);
  //   transactionTypes.add(transactionType);
  //   notifyListeners();
  // }

  // void setDebitSideLedger(TransactionType transactionType, int ledgerMasterID) {
  //   transactionType.debitSideLedger = ledgerMasterID;
  //   notifyListeners();
  // }

  // void setCreditSideLedger(TransactionType transactionType, int ledgerID) {
  //   transactionType.creditSideLedger = (ledgerID);
  //   notifyListeners();
  // }

  // bool findLedger(int id) {
  //   if (ledgers.contains(id)) {
  //     return true;
  //   }
  //   return false;
  // }
}
