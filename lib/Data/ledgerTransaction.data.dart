import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

List<LedgerTransaction> ledgerTransactionDataList = [
  LedgerTransaction(
    id: 1,
    ledgerId: 1,
    amount: 100,
    debitOrCredit: 0,
    cashOrBank: 0,
  )
];

void createLedgerTransaction(
    int id,
    int ledgerId,
    DateTime date,
    int amount,
    int debitOrCredit, // 0--debit, 1--credit
    int cashOrBank) {
  LedgerTransaction newData = LedgerTransaction(
    id: id,
    ledgerId: ledgerId,
    date: date,
    amount: amount,
    debitOrCredit: debitOrCredit,
    cashOrBank: cashOrBank,
  );
  ledgerTransactionDataList.add(newData);
}
