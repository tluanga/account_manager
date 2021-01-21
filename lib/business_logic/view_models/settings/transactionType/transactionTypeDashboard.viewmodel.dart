import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeDashboardViewModel extends ChangeNotifier {
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  List<TransactionType> transactionTypeList = [];
  void loadData() async {
    final _transactionTypeList =
        await _transactionTypeService.getTransactionTypeList();
    transactionTypeList = _transactionTypeList;
    notifyListeners();
  }
}
