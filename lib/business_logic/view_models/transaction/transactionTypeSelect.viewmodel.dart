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
    String _length = transactionTypeList.length.toString();
    print('length of list $_length in loadData');
    ChangeNotifier();
  }

  void printData() {
    String _length = transactionTypeList.length.toString();
    print('length of list $_length in printData');
    print(transactionTypeList.length.toString());
  }
}
