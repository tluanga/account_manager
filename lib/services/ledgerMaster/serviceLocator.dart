// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.

import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:get_it/get_it.dart';

import 'ledgerMaster_Implementation.service.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // Services
  serviceLocator
      .registerLazySingleton<LedgerMasterService>(() => LedgerMasterImpl());
}
