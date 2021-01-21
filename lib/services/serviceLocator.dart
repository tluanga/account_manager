// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.

import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/ledgerMasterDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/ledgerMaster/newLedgerMaster.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/settings/transactionType/transactionTypeDashboard.viewmodel.dart';
import 'package:account_manager/business_logic/view_models/transactionType.viewmodel.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:account_manager/services/transactionType/transactionType_implementation.service.dart';
import 'package:get_it/get_it.dart';

import 'ledgerMaster/ledgerMaster_Implementation.service.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // Services
  serviceLocator
      .registerLazySingleton<LedgerMasterService>(() => LedgerMasterImpl());
  serviceLocator.registerLazySingleton<TransactionTypeService>(
      () => TransactionTypeImpl());

  // View Models
  serviceLocator.registerFactory<LedgerMasterDashboardViewModel>(
      () => LedgerMasterDashboardViewModel());
  serviceLocator.registerFactory<NewLedgerMasterViewModel>(
      () => NewLedgerMasterViewModel());

  // ----------Transaction Type View Model------------
  serviceLocator.registerFactory<TransactionTypeDashboardViewModel>(
      () => TransactionTypeDashboardViewModel());
}
