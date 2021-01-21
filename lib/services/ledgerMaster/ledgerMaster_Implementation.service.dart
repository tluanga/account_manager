import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';

class LedgerMasterImpl implements LedgerMasterService {
  @override
  Future<List<LedgerMaster>> getLedgerMasterList() async {
    List<LedgerMaster> list = [];
    list.add(
      LedgerMaster(
        id: 1,
        name: 'Cash Account',
      ),
    );
    list.add(
      LedgerMaster(
        id: 2,
        name: 'Purchase Account',
      ),
    );
    return list;
  }
}
