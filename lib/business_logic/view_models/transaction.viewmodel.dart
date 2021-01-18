import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:account_manager/business_logic/view_models/ledger.viewmodel.dart';
import 'package:flutter/foundation.dart';

class TransactionViewModel extends ChangeNotifier {
  List<Transaction> transactionList = [
    Transaction(
      id: 1,
      amount: 1000,
      particular: 'Dawhkan',
      date: DateTime.now(),
      mode: 0,
      transactionTypeId: 1,
      baOrPektlak: 0,
      cashOrBank: 2,
      ),
  ];
  int transactionTypeId;
  void addTransaction(Transaction transaction) {
    transactionList.add(transaction);
  }

  void setTransactionType(int _transactionTypeId) {
    transactionTypeId = _transactionTypeId;
    ChangeNotifier();
  }

  void newTransaction(Transaction transaction) {
    transactionList.add(transaction);
    if(transaction.mode==0){
      // if(transaction.transactionType)
      // Leina
      // --find cash account and get its id
      // transaction type a zir in ledger involve tur zat a tam in a 
      // tlem thei

    }
    // Business logic to create a new row in the ledger data List
    LedgerViewModel ledgerViewModel;
    
  }
}
