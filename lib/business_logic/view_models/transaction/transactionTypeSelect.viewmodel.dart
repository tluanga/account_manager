import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeSelectViewModel extends ChangeNotifier {
  List<TransactionType> transactionTypes = [];

  // void loadData() {
  //   transactionTypes = transactionTypesData;
  // }

  // void setTransactionType(int id) {
  //   selectedTransactionType = id;
  //   notifyListeners();
  // }

  // void deSelectTransactionType(int id) {
  //   selectedTransactionType = null;
  //   notifyListeners();
  // }

  // bool checkTransactionTypeForSelection(int transactionTypeId) {
  //   if (selectedTransactionType == transactionTypeId) {
  //     return true;
  //   } else
  //     return false;
  // }
}
