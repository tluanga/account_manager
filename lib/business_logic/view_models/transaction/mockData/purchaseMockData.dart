// //-----Mock----The Business Model--
// import 'package:account_manager/business_logic/models/transaction.model.dart';

// List<Transaction> _purchaseMockData = [];
//   // Transaction _purchasemock1 = Transaction(
//   //   amount:
//   //   particular:
//   //   isCredit:
//   //   cashOrBank:
//   //   date:
//   //   creditType:
//   //   partyId:
//   //   partyName:
//   //   assetLedger:
//   //   transactionTypeId:
//   //   transactionTypeName:
//   //   debitSideLedgerId:
//   //   debitSideLedgerName:
//   //   creditSideLedgerId:
//   //   creditSideLedgerName:
//   // );
//   // To Test Type -1 Purchase Transaction

//   //--copy parameter to variable
//     //---Purchase Transaction Type -1
//     // _purchaseMockData.add(Transaction(
//     //   amount: 10000,
//     //   particular: 'Chair Leina',
//     //   isCredit: cCashDown,
//     //   cashOrBank: BANK,
//     //   date: DateTime.now(),
//     //   creditType: cCredit,
//     //   partyId: PartyMockConstant.AlexTelles,
//     //   partyName: 'Alex Telles',
//     //   assetLedger: AssetMockData.chair,
//     //   transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //   transactionTypeName: 'Purchase of Asset',
//     // ));

//     // //--Purchase Transaction Type-2
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 20000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: CASH,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.Rema,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );

//     //--Purchase Transaction Type-3
//     _purchaseMockData.add(
//       Transaction(
//         amount: 30000,
//         particular: 'Chair Leina',
//         isCredit: cCredit,
//         cashOrBank: NONE,
//         date: DateTime.now(),
//         creditType: NONE,
//         partyId: PartyMockConstant.Rotluanga,
//         partyName: 'Rotluanga',
//         assetLedger: AssetMockData.chair,
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//         transactionTypeName: 'Purchase of Asset',
//       ),
//     );

//     // //--Purchase Transaction Type-4
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );
//     // //--Purchase Transaction Type-5
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );

//     // //--Purchase Transaction Type-6
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );

//     // //--Purchase Transaction Type-7
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );

//     // //--Purchase Transaction Type-8
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );
//     // //--Purchase Transaction Type-9
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );

//     // //--Purchase Transaction Type-10
//     // _purchaseMockData.add(
//     //   Transaction(
//     //     amount: 10000,
//     //     particular: 'Chair Leina',
//     //     isCredit: cCredit,
//     //     cashOrBank: BANK,
//     //     date: DateTime.now(),
//     //     creditType: cCredit,
//     //     partyId: PartyMockConstant.AlexTelles,
//     //     partyName: 'Alex Telles',
//     //     assetLedger: AssetMockData.chair,
//     //     transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//     //     transactionTypeName: 'Purchase of Asset',
//     //   ),
//     // );
