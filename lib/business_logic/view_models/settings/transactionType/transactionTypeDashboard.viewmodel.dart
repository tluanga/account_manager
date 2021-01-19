import 'package:account_manager/Data/transactionType.data.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeDashboardViewModel extends ChangeNotifier {
  List<TransactionType> transactionTypeList;
  void loadData() {
    transactionTypeList = transactionTypesData;
  }
}
