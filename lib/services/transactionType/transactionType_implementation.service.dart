import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';

class TransactionTypeImpl implements TransactionTypeService {
  List<TransactionType> _list = [
    TransactionType.widthId(
      id: 1,
      name: 'Purchase of Material',
      description: 'Purchase of Material for reselling or Raw Material',
      type: 0, //Buy
      debitSideLedger: 1,
      creditSideLedger: 2,
    )
  ];
  int _currentDebitSideLedger = 0;
  int _currentCreditSideLedger = 0;

  @override
  Future<List<TransactionType>> getTransactionTypeList() async {
    return _list;
  }

  void setCurrentDebitSideLedger(int ledgerMasterId) {
    _currentDebitSideLedger = ledgerMasterId;
  }

  int getCurrentDebitSideLedger() {
    return _currentDebitSideLedger;
  }

  void setCurrentCreditSideLedger(int ledgerMasterId) {
    _currentCreditSideLedger = ledgerMasterId;
  }

  int getCurrentCreditSideLedger() {
    return _currentCreditSideLedger;
  }

  void clearSelectedLedgers() {
    _currentCreditSideLedger = 0;
    _currentDebitSideLedger = 0;
  }

  // Saving new Transaction Type
  @override
  Future<void> createNewTransactionType(TransactionType data) async {
    _list.add(data);
  }
}
