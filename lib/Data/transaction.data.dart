import 'package:account_manager/business_logic/models/transaction.model.dart';

List<Transaction> transactionListData = [
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

int selectedTransactionType = 0;
