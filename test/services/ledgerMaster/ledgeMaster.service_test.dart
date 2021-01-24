import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Data insertion in the Ledger Master is correct', () {
    LedgerMasterService _ledgerMasterService =
        serviceLocator<LedgerMasterService>();
    LedgerMaster _ledgerMaster =
        LedgerMaster(name: 'Cash Account', description: 'Cash Account');
    var result = _ledgerMasterService.insert(_ledgerMaster);
    print(result.toString());
    expect(result, 200);
  });
}
