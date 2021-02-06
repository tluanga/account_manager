import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/widgets.dart';

class TransactionTypeSelectViewModel extends ChangeNotifier {
  List<TransactionType> transactionTypeList = [];
  TransactionType selectedTransactionType;
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  void loadData() async {
    transactionTypeList = await _transactionTypeService.getList();
    notifyListeners();
  }

  void printData() {
    String _length = transactionTypeList.length.toString();
    print('length of list $_length in printData');
    print(transactionTypeList.length.toString());
  }

  void setFilteredData(String _searchString) async {
    transactionTypeList = await _transactionTypeService
        .getFilterdTransactionTypeList(_searchString);
    // transactionTypeList.forEach((element) {
    //   String name = element.name;
    //   print('$name');
    // });
    notifyListeners();
  }

  void loadTransactionType() async {
    transactionTypeList = await _transactionTypeService.getList();
    notifyListeners();
  }

  void setSelectedTransactionType(TransactionType _transactionType) {
    selectedTransactionType = _transactionType;
    notifyListeners();
  }
}
