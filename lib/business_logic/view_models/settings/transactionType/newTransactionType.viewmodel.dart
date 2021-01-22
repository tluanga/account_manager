import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';

class NewTransactionTypeViewModel extends ChangeNotifier {
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  String getDebitSideLedger() {
    return _transactionTypeService.getCurrentDebitSideLedger().toString();
  }

  String getCreditSideLedger() {
    return _transactionTypeService.getCurrentCreditSideLedger().toString();
  }
}
