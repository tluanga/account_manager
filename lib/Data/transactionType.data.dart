import 'package:account_manager/business_logic/models/transactionType.models.dart';

List<TransactionType> transactionTypesData = [
  TransactionType.widthId(
    id: 1,
    name: 'Purchase of Equipment',
    ledger: [1, 2],
  ),
  TransactionType.widthId(
    id: 2,
    name: 'Purchase of Other Equipments',
    ledger: [1, 2],
  ),
];

List<int> selectedLedgers = [];

// --------Search Transaction Type by Its Id
