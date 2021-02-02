//   switch (_purchaseType) {
//     //---------1----------
//     case PurchaseType.assetCashDownBank:
//       {
//         _debitSideLedgerId = _assetLedger;
//         _creditSideLedgerId = LedgerID.BANK;
//       }
//       break;
//     //------------2------------
//     case PurchaseType.assetCashDownCash:
//       {
//         _debitSideLedgerId = _assetLedger;
//         _creditSideLedgerId = LedgerID.CASHAC;
//       }
//       break;
//     //----------3------------
//     case PurchaseType.assetDebt:
//       {
//         _debitSideLedgerId = _assetLedger;
//         _creditSideLedgerId = _partyId;
//       }
//       break;
//     //-----------4------------------
//     case PurchaseType.assetDebtCashPartial:
//       {
//         _debitSideLedgerId = _assetLedger;
//         _creditSideLedgerId = LedgerID.CASHAC;
//       }
//       break;
//     //-------------5--------------------
//     case PurchaseType.assetDebtCashPartial:
//       {
//         _debitSideLedgerId = _assetLedger;
//         _creditSideLedgerId = LedgerID.CASHAC;
//       }
//       break;
//     //--------------6-----------------
//     case PurchaseType.nonAssetCashDownBank:
//       {
//         _debitSideLedgerId = LedgerID.PURCHASEAC;
//         _creditSideLedgerId = LedgerID.BANK;
//       }
//       break;
//     //-------------7---------
//     case PurchaseType.nonAssetCashDownCash:
//       {
//         _debitSideLedgerId = LedgerID.PURCHASEAC;
//         _creditSideLedgerId = LedgerID.CASHAC;
//       }
//       break;
//     //---------------------8-----------
//     case PurchaseType.nonAssetDebt:
//       {
//         _debitSideLedgerId = LedgerID.PURCHASEAC;
//         _creditSideLedgerId = _partyId;
//       }
//       break;
//     //---------------9----------------
//     case PurchaseType.nonAssetDebtCashPartial:
//       {
//         _debitSideLedgerId = LedgerID.PURCHASEAC;
//         _creditSideLedgerId = LedgerID.CASHAC;
//       }
//       break;
//     //---------------10----------------
//     case PurchaseType.nonAssetDebtCashPartial:
//       {
//         _debitSideLedgerId = LedgerID.PURCHASEAC;
//         _creditSideLedgerId = LedgerID.BANK;
//       }
//       break;
//     default:
//   }
// }
