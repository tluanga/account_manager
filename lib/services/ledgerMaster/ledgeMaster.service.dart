import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

abstract class LedgerMasterService {
  Future<List<LedgerMaster>> getLedgerMasterList();

  Future<void> createNewLedgerMaster(LedgerMaster data);
}
