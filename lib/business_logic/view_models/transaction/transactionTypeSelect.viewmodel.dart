import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeSelectViewModel extends ChangeNotifier {
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  List<TransactionType> transactionTypeList = [];
  void loadData() async {
    final _transactionTypeList =
        await _transactionTypeService.getTransactionTypeList();
    transactionTypeList = _transactionTypeList;
    notifyListeners();
  }

  void countTransactionTypeList() {
    print('count');
    print(transactionTypeList.length.toString());
  }
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
