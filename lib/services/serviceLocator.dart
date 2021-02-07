// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.

import 'package:account_manager/business_logic/view_models/dashboard/ledger_mainDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/party/newParty.screen.dart';
import 'package:account_manager/business_logic/view_models/settings/companyProfile/companyProfile.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/companyProfile/editCompanyProfile.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/editLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/newTransactionType.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/assetSelect.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newAssetLedgerCreation.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newOutwardTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newPurchaseTransaction.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transaction/newSaleTransaction.viewmodel.dart';

import 'package:account_manager/business_logic/view_models/transaction/transactionTypeSelect.viewmodel.dart';
import 'package:account_manager/services/companyProfile/companyProfile.service.dart';
import 'package:account_manager/services/companyProfile/companyProfile_impl.service.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction_impl.service.dart';

import 'package:account_manager/services/party/party.service.dart';

import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:account_manager/services/transaction/transaction_implementation.service.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:account_manager/services/transactionType/transactionType_implementation.service.dart';
import 'package:get_it/get_it.dart';

import 'Reports/tradingAccount/tradingAccount/tradingAccount.service.dart';
import 'Reports/tradingAccount/tradingAccount/tradingAccount_impl.service.dart';
import 'ledgerMaster/ledgerMaster_impl.service.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // SERVICES
  serviceLocator.registerLazySingleton<LedgerMasterService>(
    () => LedgerMasterImpl(),
  );

  serviceLocator.registerLazySingleton<TransactionTypeService>(
      () => TransactionTypeImpl());

  serviceLocator.registerLazySingleton<TransactionService>(
    () => TransactionImpl(),
  );

  serviceLocator.registerLazySingleton<LedgerTransactionService>(
    () => LedgerTransactionImpl(),
  );

  // --------Report Service--------

  serviceLocator
      .registerLazySingleton<TradingAccountService>(() => TradingAccountImpl());

  // ---Service Registration for trading account

  //VIEW MODELS
  // -----LedgerMaster
  serviceLocator.registerFactory<LedgerMasterDashboardViewModel>(
      () => LedgerMasterDashboardViewModel());
  serviceLocator.registerFactory<NewLedgerMasterViewModel>(
      () => NewLedgerMasterViewModel());
  serviceLocator.registerFactory<EditLedgerMasterViewModel>(
      () => EditLedgerMasterViewModel());

  // ----------Transaction Type View Model------------
  serviceLocator.registerFactory<TransactionTypeDashboardViewModel>(
      () => TransactionTypeDashboardViewModel());
  serviceLocator.registerFactory<NewTransactionTypeViewModel>(
      () => NewTransactionTypeViewModel());

  //----------Transaction Module -----------
  serviceLocator.registerFactory<TransactionTypeSelectViewModel>(
      () => TransactionTypeSelectViewModel());

  serviceLocator.registerFactory<NewPurchaseTransactionViewModel>(
    () => NewPurchaseTransactionViewModel(),
  );

  //----------------Asset-----------
  serviceLocator.registerFactory<NewAssetLedgerCreationViewModel>(
    () => NewAssetLedgerCreationViewModel(),
  );
  serviceLocator.registerFactory<AssetSelectViewModel>(
    () => AssetSelectViewModel(),
  );

  serviceLocator.registerFactory<NewSaleTransactionViewModel>(
    () => NewSaleTransactionViewModel(),
  );
  serviceLocator.registerFactory<NewOutwardTransactionViewModel>(
    () => NewOutwardTransactionViewModel(),
  );
  serviceLocator.registerFactory<LedgerMainDashboardViewModel>(
    () => LedgerMainDashboardViewModel(),
  );

  //-------------Party-----------------
  serviceLocator.registerFactory<NewPartyViewModel>(
    () => NewPartyViewModel(),
  );

  // serviceLocator
  //     .registerFactory<LedgerSelectViewModel>(() => LedgerSelectViewModel());
  // serviceLocator.registerFactory<DebitSideLedgerSelectViewModel>(
  //     () => DebitSideLedgerSelectViewModel());
  // serviceLocator.registerFactory<CreditSideLedgerSelectViewModel>(
  //   () => CreditSideLedgerSelectViewModel(),
  // );

  // -------------Company Profile------------
  serviceLocator
      .registerFactory<CompanyProfileService>(() => CompanyProfileImpl());

  serviceLocator.registerFactory<CompanyProfileViewModel>(
      () => CompanyProfileViewModel());
  serviceLocator.registerFactory<EditCompanyProfileViewModel>(
      () => EditCompanyProfileViewModel());
}
