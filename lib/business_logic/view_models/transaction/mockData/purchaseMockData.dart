// import 'package:account_manager/business_logic/models/transaction.model.dart';

// List<Transaction> _purchaseMockData = [];
//     //--copy parameter to variable
//     // ---Purchase Transaction Type -1

//     // --copy parameter to variable
//     // ---Purchase Transaction Type -1
//     _purchaseMockData.add(Transaction(
//       amount: 5000,
//       particular: 'Chair Leina',
//       isCredit: cCashDown,
//       cashOrBank: BANK,
//       date: DateTime.now(),
//       creditType: cCredit,
//       partyId: PartyMockConstant.AlexTelles,
//       partyName: 'Alex Telles',
//       assetLedger: AssetMockData.chair,
//       transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//       transactionTypeName: 'Purchase of Asset',
//     ));

//     //--Purchase Transaction Type-2
//     _purchaseMockData.add(
//       Transaction(
//         amount: 20000,
//         particular: 'Chair Leina',
//         isCredit: cCredit,
//         cashOrBank: CASH,
//         date: DateTime.now(),
//         creditType: cCredit,
//         partyId: PartyMockConstant.Rema,
//         partyName: 'Alex Telles',
//         assetLedger: AssetMockData.chair,
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//         transactionTypeName: 'Purchase of Asset',
//       ),
//     );

//     // --Purchase Transaction Type-3
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

//     //--Purchase Transaction Type-4
//     _purchaseMockData.add(
//       Transaction(
//         amount: 5000,
//         particular: 'Eitur Leina',
//         isCredit: cCashDown,
//         cashOrBank: CASH,
//         date: DateTime.now(),
//         creditType: cCredit,
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
//         transactionTypeName: 'Purchase of Non - Asset',
//       ),
//     );
//     //--Purchase Transaction Type-5
//     // debt of non asset non partial
//     _purchaseMockData.add(
//       Transaction(
//         amount: 10000,
//         particular: 'card board bat na',
//         isCredit: cCredit,
//         cashOrBank: BANK,
//         date: DateTime.now(),
//         creditType: cCredit,
//         partyId: PartyMockConstant.AlexTelles,
//         partyName: 'Alex Telles',
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//         transactionTypeName: 'Purchase of Raw Material',
//       ),
//     );

//     //--Purchase Transaction Type-6
//     _purchaseMockData.add(
//       Transaction(
//         amount: 7000,
//         particular: 'Thil Hralh leh tur 7000 man leina(from Bank acc)',
//         isCredit: cCashDown,
//         cashOrBank: BANK,
//         date: DateTime.now(),
//         creditType: NONE,
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
//         transactionTypeName: 'Purchase of Raw Material',
//       ),
//     );

//     //--Purchase Transaction Type-7
//     _purchaseMockData.add(
//       Transaction(
//         amount: 7000,
//         particular: 'Thil Hralh leh tur 7000 man leina(from cash acc)',
//         isCredit: cCashDown,
//         cashOrBank: CASH,
//         date: DateTime.now(),
//         creditType: NONE,
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
//         transactionTypeName: 'Purchase of Raw Material',
//       ),
//     );

//     //--Purchase Transaction Type-8
//     _purchaseMockData.add(
//       Transaction(
//         amount: 10000,
//         particular: 'Purchase of raw material',
//         isCredit: cCredit,
//         cashOrBank: NONE,
//         date: DateTime.now(),
//         creditType: cCredit,
//         partyId: PartyMockConstant.AlexTelles,
//         partyName: 'Alex Telles',
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
//         transactionTypeName: 'Purchase of raw material',
//       ),
//     );
//     //--Purchase Transaction Type-9
//     _purchaseMockData.add(
//       Transaction(
//         amount: 10000,
//         particular: 'Purchase of raw Material',
//         isCredit: cCredit,
//         cashOrBank: CASH,
//         date: DateTime.now(),
//         creditType: cPartialCredit,
//         partyId: PartyMockConstant.AlexTelles,
//         partyName: 'Alex Telles',
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
//         transactionTypeName: 'Purchase of raw Material',
//       ),
//     );

//     //--Purchase Transaction Type-10
//     _purchaseMockData.add(
//       Transaction(
//         amount: 10000,
//         particular: 'Purchase of raw Material',
//         isCredit: cCredit,
//         cashOrBank: BANK,
//         date: DateTime.now(),
//         creditType: cPartialCredit,
//         partyId: PartyMockConstant.AlexTelles,
//         partyName: 'Alex Telles',
//         transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
//         transactionTypeName: 'Purchase of raw Material',
//       ),
//     );
//     _purchaseMockData.add(
//       Transaction(
//           particular: 'Chair Leina',
//           isCredit: cCredit,
//           cashOrBank: CASH,
//           date: DateTime.now(),
//           creditType: cPartialCredit,
//           partyId: PartyMockConstant.Zasiama,
//           partyName: 'Zasiama',
//           assetLedger: AssetMockData.chair,
//           transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
//           transactionTypeName: 'Purchase of Asset'),
//     );
