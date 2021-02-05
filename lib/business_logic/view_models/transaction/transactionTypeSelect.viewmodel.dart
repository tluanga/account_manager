import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/widgets.dart';

class TransactionTypeSelectViewModel extends ChangeNotifier {
  List<TransactionType> transactionTypeList = [];
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  void loadData() async {
    transactionTypeList = await _transactionTypeService.getList();
    ChangeNotifier();
  }
}
